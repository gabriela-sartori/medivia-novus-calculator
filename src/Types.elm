module Types exposing (..)

import Bridge
import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Page
import Shared
import Url exposing (Url)


type alias FrontendModel =
    { page : Page.Model
    , shared : Shared.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked UrlRequest
    | FrontendMsg_UrlChanged Url
    | FrontendMsg_PageMsg Page.Msg
    | FrontendMsg_SharedMsg Shared.Msg


type alias ToBackend =
    Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Page.Msg
