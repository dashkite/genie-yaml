import * as _ from "@dashkite/joy"
import * as M from "@dashkite/masonry"
import yaml from "@dashkite/masonry-yaml"
import T from "@dashkite/masonry-targets"

defaults =
  targets:
    browser: [
      preset: "js"
      glob: [
        "src/**/*.yaml"
        "test/**/*.yaml"
      ]
    ]
    node: [
      preset: "js"
      glob: [
        "src/**/*.yaml"
        "test/**/*.yaml"
      ]
    ]

export default ( Genie ) ->

  options = { defaults..., ( Genie.get "yaml" )... }

  Genie.on "build", "yaml"
  
  Genie.define "yaml", M.start [
    T.glob options.targets
    M.read
    M.tr yaml
    T.extension ".${ build.preset }"
    T.write "build/${ build.target }"
  ]

