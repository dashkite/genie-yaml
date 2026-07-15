# Technical Notes

This document provides additional technical context about the Genie YAML preset.

### Target Mapping

The preset uses `@dashkite/masonry-targets` to resolve targets and `@dashkite/masonry-yaml` to process the YAML files. It pipes the files through `yaml` and adjusts the extension based on `${ build.preset }`.

### Extension Resolution

The extension resolution strictly follows `${ build.preset }`. When configuring custom targets, ensure the `preset` value corresponds to the desired output file extension (e.g., `js` or `json`).

### Genie Presets and the Decoupled Strategy

This package is designed as a Genie preset. Presets form a core part of Genie's decoupled strategy, ensuring that the main task runner remains lightweight and domain-agnostic. By isolating specific build capabilities—such as YAML transformation—into independent packages, developers can compose their build pipelines modularly. This approach minimizes dependencies in the core tool and allows creators to opt into precisely the functionality their project requires.
