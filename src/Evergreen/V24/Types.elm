module Evergreen.V24.Types exposing (..)

import Browser
import Dict
import Evergreen.V24.Bridge
import Evergreen.V24.Page
import Evergreen.V24.Shared
import Http
import Time
import Url


type alias FrontendModel =
    { page : Evergreen.V24.Page.Model
    , shared : Evergreen.V24.Shared.Model
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
    | FrontendMsg_PageMsg Evergreen.V24.Page.Msg
    | FrontendMsg_SharedMsg Evergreen.V24.Shared.Msg


type alias ToBackend =
    Evergreen.V24.Bridge.ToBackend


type BackendMsg
    = BackendMsg_DoNothing
    | BackendMsg_FetchMiracleHighscores Time.Posix
    | BackendMsg_GotMiracleHighscores Time.Posix (Result Http.Error String)


type ToFrontend
    = ToFrontend_DoNothing
    | ToFrontend_PageMsg Evergreen.V24.Page.Msg
