module Evergreen.V10.Page exposing (..)

import Evergreen.V10.Page.Home


type Model
    = Home Evergreen.V10.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V10.Page.Home.Msg
