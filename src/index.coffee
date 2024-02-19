import * as M from "@dashkite/masonry"
import * as Mh from "@dashkite/masonry-hooks"
import yaml from "@dashkite/masonry-yaml"
import T from "@dashkite/masonry-targets"
import defaults from "./defaults"

export default ( Genie ) ->

  options = { defaults..., ( Genie.get "yaml" )... }

  Genie.define "yaml:build", "yaml:clean", M.start [
    T.glob options.targets
    Mh.read
    yaml
    T.extension ".${ build.preset }"
    T.write "build/${ build.target }"
  ]

  # alias
  Genie.define "yaml", "yaml:build"

  Genie.on "build", "yaml"

  Genie.define "yaml:clean", "clean"

