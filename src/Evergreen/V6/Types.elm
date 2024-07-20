module Evergreen.V6.Types exposing (..)

import Browser
import Evergreen.V6.Bridge
import Evergreen.V6.Page
import Evergreen.V6.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V6.Page.Model
    , shared : Evergreen.V6.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V6.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V6.Shared.Msg


type alias ToBackend =
    Evergreen.V6.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V6.Page.Msg
