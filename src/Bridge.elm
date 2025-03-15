module Bridge exposing (ToBackend(..), send)

import Lamdera


send =
    Lamdera.sendToBackend


type ToBackend
    = DoNothing
    | FetchHighscores
