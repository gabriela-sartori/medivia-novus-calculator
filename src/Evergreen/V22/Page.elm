module Evergreen.V22.Page exposing (..)

import Evergreen.V22.Page.Highscores
import Evergreen.V22.Page.Home


type Model
    = Home Evergreen.V22.Page.Home.Model
    | Highscores Evergreen.V22.Page.Highscores.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V22.Page.Home.Msg
    | HighscoresMsg Evergreen.V22.Page.Highscores.Msg
