module Evergreen.V4.Types exposing (..)

import Browser
import Evergreen.V4.Bridge
import Evergreen.V4.Page
import Evergreen.V4.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V4.Page.Model
    , shared : Evergreen.V4.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V4.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V4.Shared.Msg


type alias ToBackend =
    Evergreen.V4.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V4.Page.Msg
