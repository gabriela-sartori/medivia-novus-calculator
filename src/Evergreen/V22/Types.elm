module Evergreen.V22.Types exposing (..)

import Browser
import Dict
import Evergreen.V22.Bridge
import Evergreen.V22.Page
import Evergreen.V22.Shared
import Http
import Time
import Url


type alias FrontendModel =
    { page : Evergreen.V22.Page.Model
    , shared : Evergreen.V22.Shared.Model
    }


type alias BackendModel =
    { fetchMiracleConsecutiveFails : Int
    , miracleRookHighscores :
        Dict.Dict
            Int
            (List
                { nick : String
                , level : Int
                , exp : Int
                }
            )
    }


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V22.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V22.Shared.Msg


type alias ToBackend =
    Evergreen.V22.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing
    | BackendMsg_FetchMiracleHighscores Time.Posix
    | BackendMsg_GotMiracleHighscores Time.Posix (Result Http.Error String)


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V22.Page.Msg
