module Evergreen.V24.Page.Highscores exposing (..)

import Dict
import Time


type alias Model =
    { highscores :
        Dict.Dict
            Int
            (List
                { nick : String
                , level : Int
                , exp : Int
                }
            )
    , loaded : Bool
    , now : Time.Posix
    }


type Msg
    = DoNothing
    | GotHighscores
        (Dict.Dict
            Int
            (List
                { nick : String
                , level : Int
                , exp : Int
                }
            )
        )
    | GotTime Time.Posix
