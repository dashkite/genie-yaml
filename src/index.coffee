import * as _ from "@dashkite/joy"
import * as M from "@dashkite/masonry"
import yaml from "@dashkite/masonry-yaml"
import { Files as P } from "@dashkite/genie-files"

export default ( Genie ) ->

  options = Genie.get "yaml"

  Genie.on "build", m.start [
    P.targets options.targets
    m.read
    m.tr yaml
    m.extension ".${ build.preset }"
    m.write "build/${ build.target }"
  ]

