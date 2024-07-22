module Evergreen.V9.Page exposing (..)

import Evergreen.V9.Page.Home


type Model
    = Home Evergreen.V9.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V9.Page.Home.Msg
