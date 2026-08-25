"""Turning spec operations into an intermediate representation of Swift operation types."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

from . import naming
from .model import ModelBuilder
from .spec import Operation, Spec

# Headers supplied by PlexConfiguration and ClientIdentity on every request. The spec repeats
# them as parameters on almost every operation — 4,051 declarations across 405 operations —
# which as generated arguments would bury the handful of parameters that actually vary.
CLIENT_MANAGED_HEADERS = frozenset(
    {
        "accepts",  # A misspelling of Accept; the client already asks for JSON.
        "x-plex-token",
        "x-plex-client-identifier",
        "x-plex-product",
        "x-plex-version",
        "x-plex-platform",
        "x-plex-platform-version",
        "x-plex-device",
        "x-plex-device-name",
        "x-plex-device-vendor",
        "x-plex-model",
        "x-plex-marketplace",
    }
)

# Names an operation's stored properties cannot use, because the generated struct already
# declares them to satisfy PlexOperation. A parameter called "path" is otherwise emitted as a
# stored property alongside the computed `path`, which does not compile.
RESERVED_PROPERTY_NAMES = frozenset(
    {
        "body",
        "headers",
        "host",
        "method",
        "operationID",
        "path",
        "queryItems",
        "requiresClientIdentifier",
        "requiresToken",
    }
)

# Maps a server URL from an operation's `servers` override onto an OperationHost case.
HOSTS = {
    "https://plex.tv/api/v2": ".plexTVv2",
    "https://plex.tv/api": ".plexTVv1",
    "https://plex.tv": ".plexTV",
    "https://discover.provider.plex.tv": ".discoverProvider",
    "https://clients.plex.tv/api/v2": ".clientsPlexTV",
}


@dataclass
class Parameter:
    """One input to an operation."""

    swift_name: str
    wire_name: str
    location: str  # "path", "query" or "header"
    type_name: str
    is_optional: bool
    documentation: str | None = None
    explode: bool = True
    # Whether the value is a structured object rather than a scalar, and so has to be encoded
    # in the OpenAPI `deepObject` style rather than as a single string.
    is_object: bool = False

    @property
    def rendered_type(self) -> str:
        return f"{self.type_name}?" if self.is_optional else self.type_name

    @property
    def is_array(self) -> bool:
        return self.type_name.startswith("[")


@dataclass
class RequestBodySpec:
    """The body of an operation."""

    type_name: str
    is_optional: bool
    content_type: str
    # For multipart bodies, the name of the form field the payload is sent under.
    multipart_field: str | None = None

    @property
    def rendered_type(self) -> str:
        return f"{self.type_name}?" if self.is_optional else self.type_name


@dataclass
class OperationSpec:
    """One generated operation type."""

    swift_name: str
    operation_id: str
    method: str
    path: str
    tag: str
    host: str
    success_type: str
    requires_token: bool
    requires_client_identifier: bool
    documentation: str | None
    deprecated: bool
    parameters: list[Parameter] = field(default_factory=list)
    body: RequestBodySpec | None = None

    @property
    def method_name(self) -> str:
        return naming.camel_case(self.operation_id)

    @property
    def path_parameters(self) -> list[Parameter]:
        return [p for p in self.parameters if p.location == "path"]

    @property
    def query_parameters(self) -> list[Parameter]:
        return [p for p in self.parameters if p.location == "query"]

    @property
    def header_parameters(self) -> list[Parameter]:
        return [p for p in self.parameters if p.location == "header"]

    @property
    def has_inputs(self) -> bool:
        return bool(self.parameters) or self.body is not None

    @property
    def query_can_throw(self) -> bool:
        """Whether building the query items can fail, because a value needs encoding."""
        return any(parameter.is_object for parameter in self.query_parameters)


class OperationBuilder:
    """Builds :class:`OperationSpec` values, declaring any models the operations need."""

    def __init__(self, spec: Spec, models: ModelBuilder) -> None:
        self.spec = spec
        self.models = models
        self._taken_names: set[str] = set(models.declarations)

    def build_all(self) -> list[OperationSpec]:
        return [self.build(operation) for operation in self.spec.operations]

    def build(self, operation: Operation) -> OperationSpec:
        swift_name = naming.disambiguate(
            naming.type_name(operation.operation_id), self._taken_names
        )

        # Seeded with the names the generated struct already uses, and extended as each
        # parameter claims one, so that a path parameter and a query parameter sharing a name
        # — `ids` on mergeItems is both — become distinct Swift properties.
        used_names = set(RESERVED_PROPERTY_NAMES)
        parameters = [
            parameter
            for raw in operation.parameters
            if (parameter := self._build_parameter(raw, swift_name, used_names)) is not None
        ]

        return OperationSpec(
            swift_name=swift_name,
            operation_id=operation.operation_id,
            method=operation.method,
            path=operation.path,
            tag=operation.primary_tag,
            host=self._host_for(operation),
            success_type=self._success_type(operation, swift_name),
            requires_token=self._requires_token(operation),
            requires_client_identifier=self._requires_client_identifier(operation),
            documentation=operation.description or operation.summary,
            deprecated=operation.deprecated,
            parameters=parameters,
            body=self._build_body(operation, swift_name),
        )

    # -- Parameters -----------------------------------------------------------------

    def _build_parameter(
        self, raw: dict[str, Any], owner: str, used_names: set[str]
    ) -> Parameter | None:
        location = raw.get("in")
        if location not in ("path", "query", "header"):
            return None

        name = raw["name"]
        if location == "header" and name.lower() in CLIENT_MANAGED_HEADERS:
            return None

        schema = raw.get("schema", {"type": "string"})
        type_name = self.models.type_reference(
            schema, f"{owner}{naming.pascal_case(name)}"
        )

        # A path parameter is part of the URL, so it is always required regardless of what the
        # spec says; there is no request to make without it.
        required = bool(raw.get("required")) or location == "path"

        return Parameter(
            swift_name=naming.disambiguate(naming.property_name(name), used_names),
            wire_name=name,
            location=location,
            type_name=type_name,
            is_optional=not required,
            documentation=raw.get("description"),
            explode=raw.get("explode", True),
            is_object=self._is_object_type(type_name),
        )

    def _is_object_type(self, type_name: str) -> bool:
        declaration = self.models.declarations.get(type_name.strip("[]"))
        return declaration is not None and declaration.kind in ("struct", "union")

    def _build_body(self, operation: Operation, owner: str) -> RequestBodySpec | None:
        body = operation.request_body
        if not body:
            return None
        body = self.spec.resolve(body)
        content = body.get("content") or {}
        optional = not body.get("required", False)

        # In preference order, so an operation offering both JSON and form encoding sends JSON.
        for content_type in (
            "application/json",
            "application/x-www-form-urlencoded",
            "multipart/form-data",
            "text/plain",
        ):
            media = content.get(content_type)
            if media is None:
                continue
            schema = media.get("schema")
            if schema is None:
                continue

            if content_type == "multipart/form-data":
                field = self._binary_field(schema)
                if field is None:
                    continue
                return RequestBodySpec(
                    type_name="Data",
                    is_optional=optional,
                    content_type=content_type,
                    multipart_field=field,
                )

            if content_type == "text/plain":
                # The spec points text/plain bodies at an object schema, but a plain-text body
                # is text: writeLog's own description calls it a "line separated list of log
                # items". The declared content type wins over the referenced schema.
                return RequestBodySpec(
                    type_name="String",
                    is_optional=optional,
                    content_type=content_type,
                )

            return RequestBodySpec(
                type_name=self.models.type_reference(schema, f"{owner}Body"),
                is_optional=optional,
                content_type=content_type,
            )
        return None

    def _binary_field(self, schema: Any) -> str | None:
        """The name of the single binary property of a multipart schema, if there is one."""
        resolved = self.spec.flatten(schema)
        binary = [
            name
            for name, property_schema in (resolved.get("properties") or {}).items()
            if self.spec.flatten(property_schema).get("format") == "binary"
        ]
        return binary[0] if len(binary) == 1 else None

    # -- Responses ------------------------------------------------------------------

    def _success_type(self, operation: Operation, owner: str) -> str:
        """The Swift type the operation's successful response decodes to.

        The lowest 2xx response wins. An operation with no JSON body — a 204, or a response
        the spec only describes as `text/html` — surfaces as ``EmptyResponse``, and a binary
        body surfaces as ``Data``.
        """
        codes = sorted(
            code for code in operation.responses if code.isdigit() and code.startswith("2")
        )
        for code in codes:
            response = self.spec.resolve(operation.responses[code])
            content = response.get("content") or {}

            json_media = content.get("application/json")
            if json_media and json_media.get("schema") is not None:
                return self.models.type_reference(
                    json_media["schema"], f"{owner}Response"
                )

            if any(self._is_binary(media) for media in content.values()):
                return "Data"

        return "EmptyResponse"

    def _is_binary(self, media: Any) -> bool:
        if not isinstance(media, dict):
            return False
        schema = self.spec.flatten(media.get("schema") or {})
        return schema.get("format") == "binary"

    # -- Security and hosts ---------------------------------------------------------

    @staticmethod
    def _requires_token(operation: Operation) -> bool:
        """Whether every way of satisfying the operation's security needs a token.

        An empty ``security`` list means the operation is explicitly unauthenticated. A list
        with any alternative that does not mention ``token`` means a token is optional.
        """
        if operation.security is None:
            return True
        if len(operation.security) == 0:
            return False
        return all("token" in requirement for requirement in operation.security)

    @staticmethod
    def _requires_client_identifier(operation: Operation) -> bool:
        if any(
            parameter.get("in") == "header"
            and parameter["name"].lower() == "x-plex-client-identifier"
            and parameter.get("required")
            for parameter in operation.parameters
        ):
            return True
        if operation.security is None:
            return False
        return bool(operation.security) and all(
            "clientIdentifier" in requirement for requirement in operation.security
        )

    @staticmethod
    def _host_for(operation: Operation) -> str:
        if not operation.servers:
            return ".mediaServer"
        url = operation.servers[0]
        if url in HOSTS:
            return HOSTS[url]
        return f'.absolute("{url}")'
