import * as _ from "@dashkite/joy"
import * as M from "@dashkite/masonry"
import yaml from "@dashkite/masonry-yaml"
import { File as F, Files as P } from "@dashkite/masonry-files"

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
    P.targets options.targets
    M.read
    M.tr yaml
    F.extension ".${ build.preset }"
    F.write "build/${ build.target }"
  ]

