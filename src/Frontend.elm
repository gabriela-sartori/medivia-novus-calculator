module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation
import Element as E
import Lamdera
import Page
import Route exposing (Route)
import Shared
import Types exposing (..)
import Url


type alias Model =
    FrontendModel


app =
    Lamdera.frontend
        { init = init
        , onUrlRequest = FrontendMsg_UrlClicked
        , onUrlChange = FrontendMsg_UrlChanged
        , update = update
        , updateFromBackend = updateFromBackend
        , subscriptions = subscriptions
        , view = view
        }


init : Url.Url -> Browser.Navigation.Key -> ( Model, Cmd FrontendMsg )
init url navKey =
    let
        ( shared, sharedCmd ) =
            Shared.init { navKey = navKey }

        route : Route
        route =
            Route.fromUrl url

        ( page, pageCmd ) =
            Page.init route shared Page.NotFound
    in
    ( { page = page
      , shared = shared
      }
    , Cmd.batch
        [ pageCmd
            |> Cmd.map FrontendMsg_PageMsg
        , sharedCmd
            |> Cmd.map FrontendMsg_SharedMsg
        ]
    )


update : FrontendMsg -> FrontendModel -> ( FrontendModel, Cmd FrontendMsg )
update msg model =
    case msg of
        FrontendMsg_DoNothing ->
            ( model, Cmd.none )

        FrontendMsg_UrlClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Route.push model.shared.navKey (Route.fromUrl url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )

        FrontendMsg_UrlChanged url ->
            let
                route : Route
                route =
                    Route.fromUrl url

                ( page, pageCmd ) =
                    Page.init route model.shared model.page
            in
            ( { model | page = page }
            , Cmd.map FrontendMsg_PageMsg pageCmd
            )

        FrontendMsg_PageMsg msg_ ->
            Page.update msg_ model.page model.shared
                |> Tuple.mapFirst (\m -> { model | page = m })
                |> Tuple.mapSecond (Cmd.map FrontendMsg_PageMsg)

        FrontendMsg_SharedMsg msg_ ->
            Shared.update msg_ model.shared
                |> Tuple.mapFirst (\m -> { model | shared = m })
                |> Tuple.mapSecond (Cmd.map FrontendMsg_SharedMsg)


updateFromBackend : ToFrontend -> Model -> ( Model, Cmd FrontendMsg )
updateFromBackend msg model =
    case msg of
        ToFrontend_DoNothing ->
            ( model, Cmd.none )

        ToFrontend_PageMsg msg_ ->
            update (FrontendMsg_PageMsg msg_) model


subscriptions : FrontendModel -> Sub FrontendMsg
subscriptions model =
    Page.subscriptions model.page
        |> Sub.map FrontendMsg_PageMsg


view : FrontendModel -> Browser.Document FrontendMsg
view model =
    let
        { title, body } =
            Page.view model.page model.shared
    in
    { title = title
    , body =
        [ body
            |> List.map (E.map FrontendMsg_PageMsg)
            |> E.column [ E.width E.fill, E.height E.fill ]
            |> E.layout []
        ]
    }
