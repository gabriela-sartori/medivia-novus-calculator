module Evergreen.V3.Page exposing (..)

import Evergreen.V3.Page.Home


type Model
    = Home Evergreen.V3.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V3.Page.Home.Msg
