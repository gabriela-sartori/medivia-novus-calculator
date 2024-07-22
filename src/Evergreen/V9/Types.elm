module Evergreen.V9.Types exposing (..)

import Browser
import Evergreen.V9.Bridge
import Evergreen.V9.Page
import Evergreen.V9.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V9.Page.Model
    , shared : Evergreen.V9.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V9.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V9.Shared.Msg


type alias ToBackend =
    Evergreen.V9.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V9.Page.Msg
