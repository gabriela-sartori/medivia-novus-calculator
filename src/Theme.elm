module Theme exposing
    ( black
    , blue
    , edges
    , error
    , grey100
    , grey200
    , grey900
    , pink
    , red
    , spaceX
    , spaceY
    , white
    )

import Element as E


spaceX : Int -> E.Element msg
spaceX x =
    E.el [ E.width (E.px x) ] E.none


spaceY : Int -> E.Element msg
spaceY y =
    E.el [ E.height (E.px y) ] E.none


edges : { top : Int, bottom : Int, left : Int, right : Int }
edges =
    { top = 0, bottom = 0, left = 0, right = 0 }


pink : E.Color
pink =
    E.rgb255 0xFF 0x00 0xFF


blue : E.Color
blue =
    E.rgb255 0x57 0x77 0xFF


white : E.Color
white =
    E.rgb255 0xFF 0xFF 0xFF


grey100 : E.Color
grey100 =
    E.rgb255 0xCC 0xCC 0xCC


grey200 : E.Color
grey200 =
    E.rgb255 0xDD 0xDD 0xDD


grey900 : E.Color
grey900 =
    E.rgb255 0x66 0x66 0x66


error : E.Color
error =
    E.rgb255 0xCC 0x00 0x00


red : E.Color
red =
    E.rgb255 0xCC 0x05 0x05


black : E.Color
black =
    E.rgb255 0x14 0x14 0x14
