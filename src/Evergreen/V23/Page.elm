module Evergreen.V23.Page exposing (..)

import Evergreen.V23.Page.Highscores
import Evergreen.V23.Page.Home


type Model
    = Home Evergreen.V23.Page.Home.Model
    | Highscores Evergreen.V23.Page.Highscores.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V23.Page.Home.Msg
    | HighscoresMsg Evergreen.V23.Page.Highscores.Msg
