# Usage Guides

This guide shows how to utilize the Genie YAML preset in a project to transform YAML data.

## Transforming YAML

Genie YAML transforms your project's YAML files into JavaScript or JSON files.

Once you have installed the preset as a development dependency, Genie registers it automatically. Place your YAML files in `src/` or `test/`. When you run the build command, Genie processes the files.

```shell
npx genie build
```

This compiles `src/**/*.yaml` and `test/**/*.yaml` to the `build/` directory as `js` files by default.

## Configuring targets

You can configure the preset in your `genie.yaml` to specify a different extension or output. For example, to generate JSON instead of JS.

```yaml
yaml:
  targets:
    browser:
      - preset: json
        glob:
          - src/**/*.yaml
```

This configuration tells the preset to emit `.json` files when the browser target builds.
