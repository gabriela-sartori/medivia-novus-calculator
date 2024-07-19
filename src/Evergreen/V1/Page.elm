module Evergreen.V1.Page exposing (..)

import Evergreen.V1.Page.Home


type Model
    = Home Evergreen.V1.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V1.Page.Home.Msg
