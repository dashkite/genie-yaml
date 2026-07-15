# @dashkite/genie-yaml

*Genie Preset for transforming YAML into JSON or JavaScript*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

This package provides a Genie preset for transforming YAML files into JSON or JavaScript within a build pipeline.

## Features

- Transforms YAML files efficiently during the build process.
- Hooks into standard Genie build lifecycles.
- Configurable targets to output for both browser and Node.js environments.

## Installation

Use `pnpm` to install this as a development dependency.

```shell
pnpm install -D @dashkite/genie-yaml
```

## Usage

Because this is a Genie preset library, it registers automatically when Genie runs. You can invoke it manually or rely on standard build hooks.

```shell
# Run the yaml build process directly
npx genie yaml

# Standard Genie build will also trigger yaml:build
npx genie build
```

## Other Resources

- [Usage Guides](docs/recipes.md)
- [Reference Documentation](docs/reference.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
