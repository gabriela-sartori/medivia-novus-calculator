module Evergreen.V6.Page exposing (..)

import Evergreen.V6.Page.Home


type Model
    = Home Evergreen.V6.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V6.Page.Home.Msg
