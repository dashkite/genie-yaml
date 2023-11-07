import * as _ from "@dashkite/joy"
import * as M from "@dashkite/masonry"
import yaml from "@dashkite/masonry-yaml"
import T from "@dashkite/masonry-targets"
import W from "@dashkite/masonry-watch"
import modularize from "@dashkite/masonry-export"

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
    M.tr [ yaml, modularize ]
    T.extension ".${ build.preset }"
    T.write "build/${ build.target }"
  ]

  Genie.define "yaml:watch", M.start [
    W.glob options.targets
    W.match type: "file", name: [ "add", "change" ], [
      M.read
      M.tr [ yaml, modularize ]
      T.extension ".${ build.preset }"
      T.write "build/${ build.target }"
    ]
    W.match type: "file", name: "rm", [
      T.extension ".${ build.preset }"
      T.rm "build/${ build.target }"
    ]
    W.match type: "directory", name: "rm", 
      T.rm "build/${ build.target }"        
  ]

  Genie.on "watch", "yaml:watch&"