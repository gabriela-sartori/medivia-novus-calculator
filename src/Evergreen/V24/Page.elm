module Evergreen.V24.Page exposing (..)

import Evergreen.V24.Page.Highscores
import Evergreen.V24.Page.Home


type Model
    = Home Evergreen.V24.Page.Home.Model
    | Highscores Evergreen.V24.Page.Highscores.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V24.Page.Home.Msg
    | HighscoresMsg Evergreen.V24.Page.Highscores.Msg
