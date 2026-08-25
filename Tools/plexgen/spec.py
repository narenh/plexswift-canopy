"""Loading the OpenAPI document and resolving the indirection in it.

The generator works against a spec where ``$ref`` has been followed and ``allOf`` flattened,
so that the emitters only ever see plain schema dictionaries. References to *named* component
schemas are deliberately not inlined — they become Swift type references instead, which is
what keeps the generated code proportional to the spec rather than to its expansion.
"""

from __future__ import annotations

import copy
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import yaml

HTTP_METHODS = ("get", "put", "post", "delete", "options", "head", "patch", "trace")

# Keys carrying example payloads, which are documentation rather than schema. They are dropped
# on load: they contain arbitrary nested data whose keys would otherwise be mistaken for schema
# keywords by anything walking the document.
EXAMPLE_KEYS = ("example", "examples")


class SpecError(Exception):
    """Raised when the document cannot be interpreted."""


@dataclass(frozen=True)
class Operation:
    """One HTTP operation from the ``paths`` section."""

    operation_id: str
    method: str
    path: str
    tags: tuple[str, ...]
    summary: str | None
    description: str | None
    parameters: tuple[dict[str, Any], ...]
    request_body: dict[str, Any] | None
    responses: dict[str, Any]
    servers: tuple[str, ...]
    security: tuple[dict[str, Any], ...] | None
    deprecated: bool

    @property
    def primary_tag(self) -> str:
        return self.tags[0] if self.tags else "General"


@dataclass
class Spec:
    """A loaded OpenAPI document."""

    document: dict[str, Any]
    schemas: dict[str, Any] = field(default_factory=dict)
    operations: list[Operation] = field(default_factory=list)

    @property
    def version(self) -> str:
        return str(self.document.get("info", {}).get("version", "unknown"))

    @property
    def title(self) -> str:
        return str(self.document.get("info", {}).get("title", "Plex API"))

    @property
    def description(self) -> str:
        return str(self.document.get("info", {}).get("description", ""))

    def resolve(self, node: Any) -> Any:
        """Follows a ``$ref``, returning the node itself when there is nothing to follow."""
        seen: set[str] = set()
        while isinstance(node, dict) and "$ref" in node:
            ref = node["$ref"]
            if ref in seen:
                raise SpecError(f"Circular $ref chain through {ref}")
            seen.add(ref)
            sibling = {k: v for k, v in node.items() if k != "$ref"}
            node = self._lookup(ref)
            if sibling:
                # OpenAPI 3.1 allows keywords alongside $ref; the sibling keys refine the
                # referenced schema, so they win.
                node = {**node, **sibling}
        return node

    def _lookup(self, ref: str) -> Any:
        if not ref.startswith("#/"):
            raise SpecError(f"Only local references are supported, got {ref!r}")
        node: Any = self.document
        for part in ref[2:].split("/"):
            part = part.replace("~1", "/").replace("~0", "~")
            if not isinstance(node, dict) or part not in node:
                raise SpecError(f"Cannot resolve {ref!r}")
            node = node[part]
        return node

    def schema_name_for_ref(self, ref: str) -> str | None:
        """The component schema name a ``$ref`` points at, or ``None`` if it points elsewhere."""
        prefix = "#/components/schemas/"
        if ref.startswith(prefix):
            name = ref[len(prefix) :]
            if name in self.schemas:
                return name
        return None

    def flatten(self, schema: Any) -> dict[str, Any]:
        """Resolves ``schema`` and merges any ``allOf`` members into a single schema.

        ``allOf`` in this spec is used for composition — a base object plus extra properties —
        never for constraint intersection, so a shallow merge of ``properties`` and ``required``
        is faithful. Members that are references to named schemas are merged by value here,
        because a Swift struct cannot inherit another struct's stored properties.
        """
        schema = self.resolve(schema)
        if not isinstance(schema, dict):
            return {}
        if "allOf" not in schema:
            return schema

        merged: dict[str, Any] = {}
        properties: dict[str, Any] = {}
        required: list[str] = []

        members = list(schema["allOf"])
        # Keywords sitting next to allOf apply on top of the merged result.
        siblings = {k: v for k, v in schema.items() if k != "allOf"}

        for member in members + [siblings]:
            resolved = self.flatten(member)
            for key, value in resolved.items():
                if key == "properties":
                    properties.update(value)
                elif key == "required":
                    required.extend(name for name in value if name not in required)
                else:
                    merged[key] = value

        if properties:
            merged["properties"] = properties
            merged.setdefault("type", "object")
        if required:
            merged["required"] = required
        return merged


def _strip_examples(node: Any) -> Any:
    """Removes example payloads so nothing downstream mistakes them for schema."""
    if isinstance(node, dict):
        return {
            key: _strip_examples(value)
            for key, value in node.items()
            if key not in EXAMPLE_KEYS
        }
    if isinstance(node, list):
        return [_strip_examples(item) for item in node]
    return node


def load(path: str | Path) -> Spec:
    """Loads and indexes the OpenAPI document at ``path``."""
    with open(path, "r", encoding="utf-8") as handle:
        document = yaml.safe_load(handle)

    if not isinstance(document, dict):
        raise SpecError(f"{path} does not contain an OpenAPI document")

    document = _strip_examples(document)
    spec = Spec(document=document)
    spec.schemas = document.get("components", {}).get("schemas", {})
    spec.operations = _collect_operations(spec)
    return spec


def _collect_operations(spec: Spec) -> list[Operation]:
    operations: list[Operation] = []
    seen_ids: set[str] = set()

    for path, item in spec.document.get("paths", {}).items():
        item = spec.resolve(item)
        shared_parameters = item.get("parameters", [])

        for method in HTTP_METHODS:
            if method not in item:
                continue
            raw = item[method]

            operation_id = raw.get("operationId")
            if not operation_id:
                raise SpecError(f"{method.upper()} {path} has no operationId")
            if operation_id in seen_ids:
                raise SpecError(f"Duplicate operationId {operation_id!r}")
            seen_ids.add(operation_id)

            servers = raw.get("servers", item.get("servers"))
            server_urls = tuple(entry["url"] for entry in servers) if servers else ()

            security = raw.get("security", spec.document.get("security"))

            operations.append(
                Operation(
                    operation_id=operation_id,
                    method=method,
                    path=path,
                    tags=tuple(raw.get("tags", ())),
                    summary=raw.get("summary"),
                    description=raw.get("description"),
                    parameters=tuple(
                        spec.resolve(parameter)
                        for parameter in list(shared_parameters) + list(raw.get("parameters", []))
                    ),
                    request_body=raw.get("requestBody"),
                    responses=raw.get("responses", {}),
                    servers=server_urls,
                    security=tuple(security) if security is not None else None,
                    deprecated=bool(raw.get("deprecated", False)),
                )
            )

    return operations
