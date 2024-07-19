module Evergreen.V2.Page exposing (..)

import Evergreen.V2.Page.Home


type Model
    = Home Evergreen.V2.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V2.Page.Home.Msg
