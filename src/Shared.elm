module Shared exposing (Model, Msg(..), init, isMobile, isTablet, subscriptions, update)

import Browser.Dom
import Browser.Events
import Browser.Navigation
import Element as E
import Task
import Time


type alias Model =
    { navKey : Browser.Navigation.Key
    , timezone : Time.Zone
    , screenWidth : Int
    , screenHeight : Int
    , device : E.Device
    }


init : { navKey : Browser.Navigation.Key } -> ( Model, Cmd Msg )
init props =
    let
        ( screenWidth, screenHeight ) =
            ( 1900, 1080 )
    in
    ( { timezone = Time.utc
      , navKey = props.navKey
      , screenWidth = screenWidth
      , screenHeight = screenHeight
      , device = E.classifyDevice { width = screenWidth, height = screenWidth }
      }
    , Cmd.batch
        [ Browser.Dom.getViewport
            |> Task.perform GotViewport
        , Time.here
            |> Task.perform GotZone
        ]
    )


type Msg
    = GotViewport Browser.Dom.Viewport
    | OnResize Int Int
    | GotZone Time.Zone


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotViewport data ->
            ( { model
                | screenWidth = round data.viewport.width
                , screenHeight = round data.viewport.height
                , device =
                    E.classifyDevice
                        { width = round data.viewport.width
                        , height = round data.viewport.height
                        }
              }
            , Cmd.none
            )

        OnResize width height ->
            ( { model
                | screenWidth = width
                , screenHeight = height
                , device = E.classifyDevice { width = width, height = height }
              }
            , Cmd.none
            )

        GotZone zone ->
            ( { model | timezone = zone }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onResize OnResize



-- Helpers


isMobile : Model -> Bool
isMobile shared =
    -- shared.device.class == E.Phone && (shared.device.orientation == E.Portrait)
    shared.device.class == E.Phone


isTablet : Model -> Bool
isTablet shared =
    (shared.device.class == E.Tablet)
        && (shared.device.orientation == E.Portrait)
