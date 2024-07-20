module Evergreen.V5.Page exposing (..)

import Evergreen.V5.Page.Home


type Model
    = Home Evergreen.V5.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V5.Page.Home.Msg
