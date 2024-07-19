module Route exposing
    ( Route(..)
    , back
    , fromUrl
    , href
    , push
    , reload
    , replace
    , toString
    )

import Browser.Navigation
import Html
import Html.Attributes
import Url exposing (Url)
import Url.Parser exposing ((</>), (<?>), map, s)


type Route
    = Home
    | NotFound


fromUrl : Url -> Route
fromUrl url =
    [ map Home Url.Parser.top
    ]
        |> Url.Parser.oneOf
        |> (\parser -> Url.Parser.parse parser url)
        |> Maybe.withDefault NotFound


toString : Route -> String
toString route =
    let
        urlParts : List String
        urlParts =
            case route of
                Home ->
                    []

                NotFound ->
                    [ "404" ]
    in
    "/" ++ String.join "/" urlParts


push : Browser.Navigation.Key -> Route -> Cmd msg
push navKey route =
    Browser.Navigation.pushUrl navKey <| toString route


replace : Browser.Navigation.Key -> Route -> Cmd msg
replace navKey route =
    Browser.Navigation.replaceUrl navKey <| toString route


back : Browser.Navigation.Key -> Cmd msg
back navKey =
    Browser.Navigation.back navKey 1


href : Route -> Html.Attribute msg
href route =
    Html.Attributes.href <| toString route


reload : Cmd msg
reload =
    Browser.Navigation.reload
