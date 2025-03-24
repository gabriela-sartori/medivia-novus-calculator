module Evergreen.V23.Types exposing (..)

import Browser
import Dict
import Evergreen.V23.Bridge
import Evergreen.V23.Page
import Evergreen.V23.Shared
import Http
import Time
import Url


type alias FrontendModel =
    { page : Evergreen.V23.Page.Model
    , shared : Evergreen.V23.Shared.Model
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
    , bump___REMOVE_ME : ()
    }


type FrontendMsg
    = FrontendMsg_DoNothing
    | FrontendMsg_UrlClicked Browser.UrlRequest
    | FrontendMsg_UrlChanged Url.Url
    | FrontendMsg_PageMsg Evergreen.V23.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V23.Shared.Msg


type alias ToBackend =
    Evergreen.V23.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing
    | BackendMsg_FetchMiracleHighscores Time.Posix
    | BackendMsg_GotMiracleHighscores Time.Posix (Result Http.Error String)


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V23.Page.Msg
