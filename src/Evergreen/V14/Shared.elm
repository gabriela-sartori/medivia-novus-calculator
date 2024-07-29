module Evergreen.V14.Shared exposing (..)

import Browser.Dom
import Browser.Navigation
import Element
import Time


type alias Model =
    { navKey : Browser.Navigation.Key
    , timezone : Time.Zone
    , screenWidth : Int
    , screenHeight : Int
    , device : Element.Device
    }


type Msg
    = GotViewport Browser.Dom.Viewport
    | OnResize Int Int
    | GotZone Time.Zone
