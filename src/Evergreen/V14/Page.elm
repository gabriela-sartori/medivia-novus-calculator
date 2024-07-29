module Evergreen.V14.Page exposing (..)

import Evergreen.V14.Page.Home


type Model
    = Home Evergreen.V14.Page.Home.Model
    | NotFound


type Msg
    = HomeMsg Evergreen.V14.Page.Home.Msg
