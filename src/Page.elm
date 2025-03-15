module Page exposing (Model(..), Msg(..), init, subscriptions, update, view)

import Element as E
import Page.Highscores
import Page.Home
import Route exposing (Route)
import Shared


type Model
    = Home Page.Home.Model
    | Highscores Page.Highscores.Model
    | NotFound


init : Route -> Shared.Model -> Model -> ( Model, Cmd Msg )
init route shared _ =
    case route of
        Route.NotFound ->
            ( NotFound, Route.push shared.navKey Route.Home )

        Route.Home ->
            Page.Home.init
                |> Tuple.mapFirst Home
                |> Tuple.mapSecond (Cmd.map HomeMsg)

        Route.Highscores ->
            Page.Highscores.init
                |> Tuple.mapFirst Highscores
                |> Tuple.mapSecond (Cmd.map HighscoresMsg)


type Msg
    = HomeMsg Page.Home.Msg
    | HighscoresMsg Page.Highscores.Msg


update : Msg -> Model -> Shared.Model -> ( Model, Cmd Msg )
update msg model shared =
    case ( msg, model ) of
        ( HomeMsg msg_, Home model_ ) ->
            Page.Home.update msg_ model_ shared
                |> Tuple.mapFirst Home
                |> Tuple.mapSecond (Cmd.map HomeMsg)

        ( HighscoresMsg msg_, Highscores model_ ) ->
            Page.Highscores.update msg_ model_ shared
                |> Tuple.mapFirst Highscores
                |> Tuple.mapSecond (Cmd.map HighscoresMsg)

        _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Home model_ ->
            Page.Home.subscriptions model_
                |> Sub.map HomeMsg

        Highscores model_ ->
            Page.Highscores.subscriptions model_
                |> Sub.map HighscoresMsg

        NotFound ->
            Sub.none


view :
    Model
    -> Shared.Model
    -> { title : String, body : List (E.Element Msg) }
view model shared =
    case model of
        Home model_ ->
            Page.Home.view model_ shared
                |> mapDoc HomeMsg

        Highscores model_ ->
            Page.Highscores.view model_ shared
                |> mapDoc HighscoresMsg

        NotFound ->
            { title = "Not Found"
            , body = [ E.text "Redirecting..." ]
            }


mapDoc : (a -> b) -> { title : String, body : List (E.Element a) } -> { title : String, body : List (E.Element b) }
mapDoc mapFn { title, body } =
    { title = title
    , body = List.map (E.map mapFn) body
    }
