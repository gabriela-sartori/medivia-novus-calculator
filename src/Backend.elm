module Backend exposing (..)

import Bridge
import Dict
import Html.Parser
import Http
import Lamdera exposing (ClientId, SessionId)
import List.Extra
import Page
import Page.Highscores
import Time
import Types exposing (..)


type alias Model =
    BackendModel


app =
    Lamdera.backend
        { init = init
        , update = update
        , updateFromFrontend = updateFromFrontend
        , subscriptions = subscriptions
        }


init : ( Model, Cmd BackendMsg )
init =
    ( { fetchMiracleConsecutiveFails = 0
      , miracleRookHighscores = Dict.empty
      , bump___REMOVE_ME = ()
      }
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        BackendMsg_DoNothing ->
            ( model, Cmd.none )

        BackendMsg_FetchMiracleHighscores now ->
            ( model
            , Http.get
                { url = "https://www.miracle74.com/?subtopic=highscores&vocation=0"
                , expect = Http.expectString (BackendMsg_GotMiracleHighscores now)
                }
            )

        BackendMsg_GotMiracleHighscores now response ->
            case response of
                Ok html ->
                    let
                        maybeCharacters : Maybe (List { nick : String, level : Int, exp : Int })
                        maybeCharacters =
                            Html.Parser.run Html.Parser.noCharRefs html
                                |> Result.toMaybe
                                |> Maybe.andThen
                                    (\nodes ->
                                        nodes
                                            |> cleanSpaces
                                            |> findTableRows
                                            |> Maybe.map toRow
                                    )
                    in
                    case maybeCharacters of
                        Just characters ->
                            ( { model
                                | fetchMiracleConsecutiveFails = 0
                                , miracleRookHighscores = Dict.insert (Time.posixToMillis now) characters model.miracleRookHighscores
                              }
                            , Cmd.none
                            )

                        Nothing ->
                            ( { model | fetchMiracleConsecutiveFails = model.fetchMiracleConsecutiveFails + 1 }
                            , Cmd.none
                            )

                Err _ ->
                    ( { model | fetchMiracleConsecutiveFails = model.fetchMiracleConsecutiveFails + 1 }
                    , Cmd.none
                    )


cleanSpaces : List Html.Parser.Node -> List Html.Parser.Node
cleanSpaces nodes =
    nodes
        |> List.filterMap
            (\node ->
                case node of
                    Html.Parser.Element type_ attrs children ->
                        children
                            |> cleanSpaces
                            |> Html.Parser.Element type_ attrs
                            |> Just

                    Html.Parser.Text text ->
                        if String.contains "\t" text || String.contains "\n" text then
                            Nothing

                        else
                            Just node

                    Html.Parser.Comment _ ->
                        Nothing
            )


findTableRows : List Html.Parser.Node -> Maybe (List Html.Parser.Node)
findTableRows nodes =
    nodes
        |> List.Extra.findMap
            (\node ->
                case node of
                    Html.Parser.Element "table" [ ( "class", "TableContent InnerBorder" ), ( "width", "100%" ) ] chidren ->
                        Just chidren

                    Html.Parser.Element _ _ children ->
                        findTableRows children

                    _ ->
                        Nothing
            )


toRow : List Html.Parser.Node -> List { nick : String, level : Int, exp : Int }
toRow children =
    children
        |> List.filterMap
            (\child ->
                case child of
                    -- <tr bgcolor="#22282c">
                    --     <td style="text-align:left">1</td>
                    --     <td>
                    --         <img src="/images/flags/br.gif" style="vertical-align:-1px;">
                    --     </td>
                    --     <td>
                    --     <b><a href="?subtopic=characters&name=Desespero">Desespero</a></b>
                    --     </td>
                    --     <td>None</td>
                    --     <td>43</td>
                    --     <td>1197697</td>
                    -- </tr>
                    Html.Parser.Element "tr" _ [ _, _, Html.Parser.Element "td" _ [ Html.Parser.Element "b" _ [ Html.Parser.Element "a" _ [ Html.Parser.Text nick ] ] ], _, Html.Parser.Element "td" _ [ Html.Parser.Text level ], Html.Parser.Element "td" _ [ Html.Parser.Text exp ] ] ->
                        Just
                            { nick = nick
                            , level = String.toInt level |> Maybe.withDefault -1
                            , exp = exp |> String.toInt |> Maybe.withDefault -1
                            }

                    _ ->
                        Nothing
            )


subscriptions : Model -> Sub BackendMsg
subscriptions _ =
    Time.every twelveHours BackendMsg_FetchMiracleHighscores


twelveHours : Float
twelveHours =
    12 * 60 * 60 * 1000


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend _ clientId msg model =
    case msg of
        Bridge.DoNothing ->
            ( model, Cmd.none )

        Bridge.FetchHighscores ->
            ( model
            , Lamdera.sendToFrontend clientId
                (ToFrontend_PageMsg
                    (Page.HighscoresMsg
                        (Page.Highscores.GotHighscores model.miracleRookHighscores)
                    )
                )
            )
