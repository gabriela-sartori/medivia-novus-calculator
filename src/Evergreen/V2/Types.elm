module Evergreen.V2.Types exposing (..)

import Browser
import Evergreen.V2.Bridge
import Evergreen.V2.Page
import Evergreen.V2.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V2.Page.Model
    , shared : Evergreen.V2.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V2.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V2.Shared.Msg


type alias ToBackend =
    Evergreen.V2.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V2.Page.Msg
