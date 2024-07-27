module Evergreen.V10.Types exposing (..)

import Browser
import Evergreen.V10.Bridge
import Evergreen.V10.Page
import Evergreen.V10.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V10.Page.Model
    , shared : Evergreen.V10.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V10.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V10.Shared.Msg


type alias ToBackend =
    Evergreen.V10.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V10.Page.Msg
