#!/usr/bin/env python3
"""Generates the Swift sources under ``Sources/Plexswift/Generated`` from the vendored spec.

Usage:
    python Tools/generate.py [--spec PATH] [--output DIR] [--check]

``--check`` reports whether the generated sources are up to date without writing anything,
which is what CI runs.
"""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path

from plexgen import emit_models, emit_tests, spec as spec_module
from plexgen.model import ModelBuilder

REPO_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_SPEC = REPO_ROOT / "Spec" / "plex-api-spec.yaml"
DEFAULT_SOURCES = REPO_ROOT / "Sources" / "Plexswift" / "Generated"
DEFAULT_TESTS = REPO_ROOT / "Tests" / "PlexswiftTests" / "Generated"


def generate(spec_path: Path) -> tuple[dict[str, str], dict[str, str]]:
    """Returns the generated source files and test files, each keyed by relative path."""
    spec = spec_module.load(spec_path)

    builder = ModelBuilder(spec)
    builder.build_components()

    sources: dict[str, str] = {}
    for name, declaration in sorted(builder.declarations.items()):
        sources[f"Models/{name}.swift"] = emit_models.render_file([declaration])

    tests: dict[str, str] = {}
    examples = emit_tests.collect_examples(spec, builder)
    for type_name, example in sorted(examples.items()):
        tests[f"Fixtures/{type_name}.json"] = emit_tests.render_fixture(example)
    tests["GeneratedModelDecodingTests.swift"] = emit_tests.render_test_file(
        sorted(examples)
    )

    return sources, tests


def write(files: dict[str, str], output: Path) -> None:
    """Replaces the contents of ``output`` with ``files``."""
    if output.exists():
        shutil.rmtree(output)
    for relative, contents in files.items():
        path = output / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(contents, encoding="utf-8")


def check(files: dict[str, str], output: Path) -> list[str]:
    """Returns a description of every difference between ``files`` and what is on disk."""
    problems: list[str] = []

    existing = (
        {
            str(path.relative_to(output)): path.read_text(encoding="utf-8")
            for path in sorted(output.rglob("*"))
            if path.is_file()
        }
        if output.exists()
        else {}
    )

    for relative in sorted(set(files) - set(existing)):
        problems.append(f"missing: {relative}")
    for relative in sorted(set(existing) - set(files)):
        problems.append(f"unexpected: {relative}")
    for relative in sorted(set(files) & set(existing)):
        if files[relative] != existing[relative]:
            problems.append(f"stale: {relative}")

    return problems


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--spec", type=Path, default=DEFAULT_SPEC)
    parser.add_argument("--sources", type=Path, default=DEFAULT_SOURCES)
    parser.add_argument("--tests", type=Path, default=DEFAULT_TESTS)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Report whether the generated files are up to date, without writing.",
    )
    arguments = parser.parse_args(argv)

    sources, tests = generate(arguments.spec)
    outputs = [(sources, arguments.sources), (tests, arguments.tests)]

    if arguments.check:
        problems = [
            f"{directory.relative_to(REPO_ROOT)}: {problem}"
            for files, directory in outputs
            for problem in check(files, directory)
        ]
        if problems:
            print("Generated files are out of date:", file=sys.stderr)
            for problem in problems:
                print(f"  {problem}", file=sys.stderr)
            print("\nRun `python Tools/generate.py` and commit the result.", file=sys.stderr)
            return 1
        print(f"{len(sources) + len(tests)} generated files are up to date.")
        return 0

    for files, directory in outputs:
        write(files, directory)
        print(f"Wrote {len(files)} files to {directory.relative_to(REPO_ROOT)}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
