module Evergreen.V15.Types exposing (..)

import Browser
import Evergreen.V15.Bridge
import Evergreen.V15.Page
import Evergreen.V15.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V15.Page.Model
    , shared : Evergreen.V15.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V15.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V15.Shared.Msg


type alias ToBackend =
    Evergreen.V15.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V15.Page.Msg
