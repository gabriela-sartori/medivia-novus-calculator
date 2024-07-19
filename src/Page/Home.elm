module Page.Home exposing (Model, Msg, init, subscriptions, update, view)

import Bridge
import Element as E
import Element.Border as EBO
import Element.Font as EF
import Element.Input as EI
import Shared
import Theme exposing (edges)


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}
    , Cmd.none
    )


type Msg
    = DoNothing


update : Msg -> Model -> Shared.Model -> ( Model, Cmd Msg )
update msg model _ =
    case msg of
        DoNothing ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Shared.Model -> { title : String, body : List (E.Element Msg) }
view model shared =
    { title = "Home"
    , body = [ view_ model shared ]
    }


view_ : Model -> Shared.Model -> E.Element Msg
view_ model _ =
    E.column [ E.centerX, E.paddingEach { edges | top = 128 } ]
        [ E.column
            [ E.width (E.px 400)
            , E.height (E.px 300)
            , E.padding 16
            , EBO.width 1
            , EBO.rounded 4
            ]
            [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Calculator")
            , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
            ]
        ]
