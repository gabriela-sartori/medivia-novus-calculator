module Evergreen.V14.Types exposing (..)

import Browser
import Evergreen.V14.Bridge
import Evergreen.V14.Page
import Evergreen.V14.Shared
import Url


type alias FrontendModel =
    { page : Evergreen.V14.Page.Model
    , shared : Evergreen.V14.Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V14.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V14.Shared.Msg


type alias ToBackend =
    Evergreen.V14.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V14.Page.Msg
