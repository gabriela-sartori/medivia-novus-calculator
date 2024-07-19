module Evergreen.V4.Page exposing (..)

import Evergreen.V4.Page.Home


type Model
    = Home Evergreen.V4.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V4.Page.Home.Msg
