module Evergreen.V15.Page exposing (..)

import Evergreen.V15.Page.Home


type Model
    = Home Evergreen.V15.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V15.Page.Home.Msg
