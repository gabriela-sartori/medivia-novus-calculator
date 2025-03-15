module Page.Highscores exposing (Model, Msg(..), init, subscriptions, update, view)

import Bridge
import Dict exposing (Dict)
import Element as E
import Element.Border as EBO
import Element.Font as EF
import Element.Input as EI
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import Lamdera
import List.Extra
import Set exposing (Set)
import Shared
import Task
import Theme exposing (edges)
import Time


type alias Model =
    { highscores : Dict Int (List { nick : String, level : Int, exp : Int })
    , loaded : Bool
    , now : Time.Posix
    }


init : ( Model, Cmd Msg )
init =
    ( { highscores = Dict.empty
      , loaded = False
      , now = Time.millisToPosix 0
      }
    , Cmd.batch
        [ Bridge.send Bridge.FetchHighscores
        , Task.perform GotTime Time.now
        ]
    )


type Msg
    = DoNothing
    | GotHighscores (Dict Int (List { nick : String, level : Int, exp : Int }))
    | GotTime Time.Posix


update : Msg -> Model -> Shared.Model -> ( Model, Cmd Msg )
update msg model _ =
    case msg of
        DoNothing ->
            ( model, Cmd.none )

        GotHighscores highscores ->
            ( { model | highscores = highscores, loaded = True }, Cmd.none )

        GotTime now ->
            ( { model | now = now }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Shared.Model -> { title : String, body : List (E.Element Msg) }
view model shared =
    { title = "Highscores"
    , body = [ view_ model shared ]
    }


view_ : Model -> Shared.Model -> E.Element Msg
view_ model shared =
    if not model.loaded then
        E.column [ E.padding 16 ] [ E.text "..." ]

    else
        E.column
            [ E.padding 16 ]
            [ E.row []
                [ E.text "Fetches: "
                , E.text (String.fromInt (Dict.size model.highscores))
                ]
            , E.column []
                (mostExpLastXDays model 7
                    |> List.map
                        (\char ->
                            E.row [ EF.size 16 ]
                                [ E.text char.nick
                                , E.text " gained "
                                , E.text (String.fromInt char.gained)
                                ]
                        )
                )
            ]


mostExpLastXDays : Model -> Int -> List { nick : String, gained : Int }
mostExpLastXDays model days =
    let
        past : Int
        past =
            Time.posixToMillis model.now - days * 24 * 60 * 60 * 1000

        list : List ( Int, List { nick : String, level : Int, exp : Int } )
        list =
            model.highscores
                |> Dict.toList
                |> List.Extra.dropWhile
                    (\( time, _ ) ->
                        time < past
                    )
    in
    List.head list
        |> Maybe.andThen
            (\( _, firsts ) ->
                List.Extra.last list
                    |> Maybe.map
                        (\( _, lasts ) ->
                            let
                                nicks : Set String
                                nicks =
                                    (firsts ++ lasts)
                                        |> List.map .nick
                                        |> Set.fromList

                                firstsDict : Dict String { nick : String, level : Int, exp : Int }
                                firstsDict =
                                    firsts
                                        |> List.map (\data -> ( data.nick, data ))
                                        |> Dict.fromList

                                lastsDict : Dict String { nick : String, level : Int, exp : Int }
                                lastsDict =
                                    lasts
                                        |> List.map (\data -> ( data.nick, data ))
                                        |> Dict.fromList
                            in
                            nicks
                                |> Set.toList
                                |> List.map
                                    (\nick ->
                                        let
                                            gained : Int
                                            gained =
                                                Maybe.map2 (\first last -> last.exp - first.exp)
                                                    (Dict.get nick firstsDict)
                                                    (Dict.get nick lastsDict)
                                                    |> Maybe.withDefault -1
                                        in
                                        { nick = nick, gained = gained }
                                    )
                        )
            )
        |> Maybe.withDefault []
        |> List.sortBy (.gained >> negate)
