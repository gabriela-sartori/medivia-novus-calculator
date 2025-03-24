module Types exposing (..)

import Bridge
import Browser exposing (UrlRequest)
import Dict exposing (Dict)
import Http
import Page
import Shared
import Time
import Url exposing (Url)


type alias FrontendModel =
    { page : Page.Model
    , shared : Shared.Model
    }


type alias BackendModel =
    { fetchMiracleConsecutiveFails : Int
    , miracleRookHighscores : Dict Int (List { nick : String, level : Int, exp : Int })
    }


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
    | BackendMsg_FetchMiracleHighscores Time.Posix
    | BackendMsg_GotMiracleHighscores Time.Posix (Result Http.Error String)


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Page.Msg
