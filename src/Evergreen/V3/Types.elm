module Evergreen.V3.Types exposing (..)

import Browser
import Evergreen.V3.Bridge
import Evergreen.V3.Page
import Evergreen.V3.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V3.Page.Model
    , shared : Evergreen.V3.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V3.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V3.Shared.Msg


type alias ToBackend =
    Evergreen.V3.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V3.Page.Msg
