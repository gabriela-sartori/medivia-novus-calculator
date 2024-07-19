module Evergreen.V1.Types exposing (..)

import Browser
import Evergreen.V1.Bridge
import Evergreen.V1.Page
import Evergreen.V1.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V1.Page.Model
    , shared : Evergreen.V1.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V1.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V1.Shared.Msg


type alias ToBackend =
    Evergreen.V1.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V1.Page.Msg
