module Evergreen.V5.Types exposing (..)

import Browser
import Evergreen.V5.Bridge
import Evergreen.V5.Page
import Evergreen.V5.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V5.Page.Model
    , shared : Evergreen.V5.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V5.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V5.Shared.Msg


type alias ToBackend =
    Evergreen.V5.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V5.Page.Msg
