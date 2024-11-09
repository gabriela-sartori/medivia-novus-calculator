module Page.Home exposing (FightStance(..), Model, Msg(..), init, subscriptions, update, view)

import Dict exposing (Dict)
import Element as E
import Element.Border as EBO
import Element.Font as EF
import Element.Input as EI
import Html as H
import Html.Attributes as HA
import Html.Events as HE
import Shared
import Theme exposing (edges)


type alias Model =
    { meleeFightStance : FightStance
    , meleeLevel : String
    , meleeSkill : String
    , meleeAttack : String
    , meleeStrength : String
    , meleeMonster : String
    , distanceFightStance : FightStance
    , distanceLevel : String
    , distanceSkill : String
    , distanceAttack : String
    , distanceDexterity : String
    , distanceMonster : String
    , blockingFightStance : FightStance
    , blockingSkill : String
    , blockingDefense : String
    , totalArmor : String
    , worldType : WorldType
    , skillDistanceFrom : String
    , skillDistanceTo : String
    , skillDistancePercentToGo : String
    , skillMeleeFrom : String
    , skillMeleeTo : String
    , skillMeleePercentToGo : String
    , skillBlockingFrom : String
    , skillBlockingTo : String
    , skillBlockingPercentToGo : String
    , magicLevelFrom : String
    , magicLevelTo : String
    , magicLevelPercentToGo : String
    , skillFishingFrom : String
    , skillFishingTo : String
    , skillFishingPercentToGo : String
    , upLevelFrom : String
    , upLevelTo : String
    , upPercentToGo : String
    , upXph : String
    }


init : ( Model, Cmd Msg )
init =
    ( { meleeFightStance = FightStanceOffensive
      , meleeLevel = "1"
      , meleeSkill = "10"
      , meleeAttack = "16"
      , meleeStrength = "0"
      , meleeMonster = "Dummy"
      , distanceFightStance = FightStanceOffensive
      , distanceLevel = "1"
      , distanceSkill = "10"
      , distanceAttack = "30"
      , distanceDexterity = "0"
      , distanceMonster = "Dummy"
      , blockingFightStance = FightStanceDefensive
      , blockingSkill = "10"
      , blockingDefense = "10"
      , totalArmor = "25"
      , worldType = WorldTypeFast
      , skillDistanceFrom = "10"
      , skillDistanceTo = "11"
      , skillDistancePercentToGo = "10000"
      , skillMeleeFrom = "10"
      , skillMeleeTo = "11"
      , skillMeleePercentToGo = "10000"
      , skillBlockingFrom = "10"
      , skillBlockingTo = "11"
      , skillBlockingPercentToGo = "10000"
      , magicLevelFrom = "0"
      , magicLevelTo = "5"
      , magicLevelPercentToGo = "10000"
      , skillFishingFrom = "10"
      , skillFishingTo = "11"
      , skillFishingPercentToGo = "10000"
      , upLevelFrom = "100"
      , upLevelTo = "101"
      , upPercentToGo = "10000"
      , upXph = "30000"
      }
    , Cmd.none
    )


type WorldType
    = WorldTypeSlow
    | WorldTypeFast


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel String
    | InputMeleeSkill String
    | InputMeleeAttack String
    | InputMeleeStrength String
    | InputMeleeMonster String
    | InputDistanceFightStance FightStance
    | InputDistanceLevel String
    | InputDistanceSkill String
    | InputDistanceAttack String
    | InputDistanceDexterity String
    | InputDistanceMonster String
    | InputBlockingFightStance FightStance
    | InputBlockingSkill String
    | InputBlockingDefense String
    | InputTotalArmor String
    | InputWorldType WorldType
    | InputSkillDistanceFrom String
    | InputSkillDistanceTo String
    | InputSkillDistancePercentToGo String
    | InputSkillMeleeFrom String
    | InputSkillMeleeTo String
    | InputSkillMeleePercentToGo String
    | InputSkillBlockingFrom String
    | InputSkillBlockingTo String
    | InputSkillBlockingPercentToGo String
    | InputMagicLevelFrom String
    | InputMagicLevelTo String
    | InputMagicLevelPercentToGo String
    | InputSkillFishingFrom String
    | InputSkillFishingTo String
    | InputSkillFishingPercentToGo String
    | InputUpLevelFrom String
    | InputUpLevelTo String
    | InputUpPercentToGo String
    | InputUpXph String


update : Msg -> Model -> Shared.Model -> ( Model, Cmd Msg )
update msg model _ =
    case msg of
        InputMeleeFightStance stance ->
            ( { model | meleeFightStance = stance }, Cmd.none )

        InputMeleeLevel value ->
            ( { model | meleeLevel = value }, Cmd.none )

        InputMeleeSkill value ->
            ( { model | meleeSkill = value }, Cmd.none )

        InputMeleeAttack value ->
            ( { model | meleeAttack = value }, Cmd.none )

        InputMeleeStrength value ->
            ( { model | meleeStrength = value }, Cmd.none )

        InputMeleeMonster value ->
            ( { model | meleeMonster = value }, Cmd.none )

        InputDistanceFightStance stance ->
            ( { model | distanceFightStance = stance }, Cmd.none )

        InputDistanceLevel value ->
            ( { model | distanceLevel = value }, Cmd.none )

        InputDistanceSkill value ->
            ( { model | distanceSkill = value }, Cmd.none )

        InputDistanceAttack value ->
            ( { model | distanceAttack = value }, Cmd.none )

        InputDistanceDexterity value ->
            ( { model | distanceDexterity = value }, Cmd.none )

        InputDistanceMonster value ->
            ( { model | distanceMonster = value }, Cmd.none )

        InputBlockingFightStance value ->
            ( { model | blockingFightStance = value }, Cmd.none )

        InputBlockingSkill value ->
            ( { model | blockingSkill = value }, Cmd.none )

        InputBlockingDefense value ->
            ( { model | blockingDefense = value }, Cmd.none )

        InputTotalArmor value ->
            ( { model | totalArmor = value }, Cmd.none )

        InputWorldType value ->
            ( { model | worldType = value }, Cmd.none )

        InputSkillDistanceFrom value ->
            ( { model | skillDistanceFrom = value }, Cmd.none )

        InputSkillDistanceTo value ->
            ( { model | skillDistanceTo = value }, Cmd.none )

        InputSkillDistancePercentToGo value ->
            ( { model | skillDistancePercentToGo = value }, Cmd.none )

        InputSkillMeleeFrom value ->
            ( { model | skillMeleeFrom = value }, Cmd.none )

        InputSkillMeleeTo value ->
            ( { model | skillMeleeTo = value }, Cmd.none )

        InputSkillMeleePercentToGo value ->
            ( { model | skillMeleePercentToGo = value }, Cmd.none )

        InputSkillBlockingFrom value ->
            ( { model | skillBlockingFrom = value }, Cmd.none )

        InputSkillBlockingTo value ->
            ( { model | skillBlockingTo = value }, Cmd.none )

        InputSkillBlockingPercentToGo value ->
            ( { model | skillBlockingPercentToGo = value }, Cmd.none )

        InputMagicLevelFrom value ->
            ( { model | magicLevelFrom = value }, Cmd.none )

        InputMagicLevelTo value ->
            ( { model | magicLevelTo = value }, Cmd.none )

        InputMagicLevelPercentToGo value ->
            ( { model | magicLevelPercentToGo = value }, Cmd.none )

        InputSkillFishingFrom value ->
            ( { model | skillFishingFrom = value }, Cmd.none )

        InputSkillFishingTo value ->
            ( { model | skillFishingTo = value }, Cmd.none )

        InputSkillFishingPercentToGo value ->
            ( { model | skillFishingPercentToGo = value }, Cmd.none )

        InputUpLevelFrom value ->
            ( { model | upLevelFrom = value }, Cmd.none )

        InputUpLevelTo value ->
            ( { model | upLevelTo = value }, Cmd.none )

        InputUpPercentToGo value ->
            ( { model | upPercentToGo = value }, Cmd.none )

        InputUpXph value ->
            ( { model | upXph = value }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Shared.Model -> { title : String, body : List (E.Element Msg) }
view model shared =
    { title = "Home"
    , body = [ view_ model shared ]
    }


view_ : Model -> Shared.Model -> E.Element Msg
view_ model shared =
    let
        isMobile : Bool
        isMobile =
            shared.screenWidth <= 600

        mobileRatio : Int
        mobileRatio =
            if isMobile then
                2

            else
                1
    in
    E.column
        [ if isMobile then
            E.width E.fill

          else
            E.centerX
        , E.padding (32 // mobileRatio)
        ]
        [ E.el
            [ EF.bold
            , if isMobile then
                EF.size 24

              else
                EF.size 30
            , E.centerX
            ]
            (E.text "Medivia Novus Calculator")
        , E.link
            [ EF.bold
            , EF.size 12
            , EF.color Theme.red
            , EF.underline
            , E.centerX
            , E.htmlAttribute (HA.target "_blank")
            ]
            { url = "https://medivia.online/community/character/ga%20bi"
            , label = E.text "by Ga bi"
            }
        , Theme.spaceY 32
        , E.el [ EF.bold, EF.size 26, E.centerX ] (E.text "Damage")
        , Theme.spaceY 16
        , viewContainer isMobile
            [ viewMeleeDamage model
            , viewDistanceDamage model
            ]
        , Theme.spaceY (32 // mobileRatio)
        , viewContainer isMobile
            [ viewMaxBlockingDamage model
            , viewArmorReducingDamage model
            ]
        , Theme.spaceY (32 // mobileRatio)
        , E.el [ EF.bold, EF.size 26, E.centerX ] (E.text "Skills")
        , Theme.spaceY (16 // mobileRatio)
        , let
            viewRadio =
                if isMobile then
                    EI.radio

                else
                    EI.radioRow
          in
          E.column [ E.centerX ]
            [ viewRadio [ E.spacing 8 ]
                { onChange = InputWorldType
                , options =
                    [ EI.option WorldTypeSlow (E.text "1x skills and ML")
                    , EI.option WorldTypeFast (E.text "4x skills, 3x ML, 2x regen")
                    ]
                , selected = Just model.worldType
                , label = EI.labelHidden "world type"
                }
            ]
        , Theme.spaceY (16 // mobileRatio)
        , viewContainer isMobile
            [ viewMeleeSkillCalculator model
            , viewDistanceSkillCalculator model
            ]
        , Theme.spaceY (32 // mobileRatio)
        , viewContainer isMobile
            [ viewBlockingSkillCalculator model
            , viewMagicLevelCalculator model
            ]
        , Theme.spaceY (32 // mobileRatio)
        , viewContainer isMobile
            [ viewFishingSkillCalculator model
            , viewAdvanceLevelCalculator model
            ]
        ]


viewContainer : Bool -> List (E.Element msg) -> E.Element msg
viewContainer isMobile content =
    if isMobile then
        E.column
            [ E.width E.fill
            , E.spacing 16
            , E.paddingXY 16 0
            ]
            content

    else
        E.row
            [ E.width (E.px 600)
            , E.spacing 32
            ]
            content


viewMeleeDamage : Model -> E.Element Msg
viewMeleeDamage model =
    E.column
        [ E.width E.fill
        , E.height (E.px 580)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , E.row [ E.centerX, E.paddingEach { edges | top = 12 } ]
            [ EI.radioRow [ E.spacing 8 ]
                { onChange = InputMeleeFightStance
                , options = fightStanceOptions
                , selected = Just model.meleeFightStance
                , label = EI.labelHidden "fight stance"
                }
            ]
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMeleeLevel
            , text = model.meleeLevel
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Level")
            }
        , E.el
            [ EF.size 12
            , E.paddingEach { edges | top = 4 }
            , E.transparent (strToInt model.meleeAttack > 15)
            ]
            (E.text "Level is ignored when attack <= 15")
        , EI.text [ E.width E.fill ]
            { onChange = InputMeleeSkill
            , text = model.meleeSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Melee Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMeleeAttack
            , text = model.meleeAttack
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Attack")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMeleeStrength
            , text = model.meleeStrength
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Strength")
            }
        , Theme.spaceY 12
        , E.html
            (H.select [ HE.onInput InputMeleeMonster, HA.style "width" "100%" ]
                (monsters
                    |> List.map
                        (\monster ->
                            let
                                ( minArm, maxArm ) =
                                    monster.arm

                                ( minDef, maxDef ) =
                                    monster.def
                            in
                            H.option [ HA.value monster.name ]
                                [ H.text monster.name
                                , H.text " Arm: "
                                , H.text (String.fromInt minArm)
                                , H.text "-"
                                , H.text (String.fromInt maxArm)
                                , H.text " Def: "
                                , H.text (String.fromInt minDef)
                                , H.text "-"
                                , H.text (String.fromInt maxDef)
                                ]
                        )
                )
            )
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                meleeDamage
                    { level = model.meleeLevel |> String.toInt |> Maybe.withDefault 0
                    , skill = model.meleeSkill |> String.toInt |> Maybe.withDefault 0
                    , attack = model.meleeAttack |> String.toInt |> Maybe.withDefault 0
                    , stance = model.meleeFightStance
                    , strength = model.meleeStrength |> String.toInt |> Maybe.withDefault 0
                    }

            dmgBlock : { min : Int, max : Int }
            dmgBlock =
                monstersDict
                    |> Dict.get model.meleeMonster
                    |> Maybe.withDefault { name = "Error", arm = ( 0, 0 ), def = ( 0, 0 ) }
                    |> (\monster ->
                            { min = Tuple.first monster.def + Tuple.first monster.arm
                            , max = Tuple.second monster.def + Tuple.second monster.arm
                            }
                       )

            minDamage : Float
            minDamage =
                damageRange.min - toFloat dmgBlock.max

            maxDamage : Float
            maxDamage =
                damageRange.max - toFloat dmgBlock.min
          in
          E.column [ E.spacing 4, E.paddingEach { edges | top = 8 } ]
            [ E.row [ E.spacing 32 ]
                [ E.row [ E.spacing 8 ]
                    [ E.el [ EF.bold ] (E.text "Min:")
                    , viewFloat minDamage
                    ]
                , E.row [ E.spacing 8 ]
                    [ E.el [ EF.bold ] (E.text "Max:")
                    , viewFloat maxDamage
                    ]
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Avg:")
                , viewFloat (toFloat (truncate minDamage + truncate maxDamage) / 2)
                ]
            ]
        ]


viewDistanceDamage : Model -> E.Element Msg
viewDistanceDamage model =
    E.column
        [ E.width E.fill
        , E.height (E.px 580)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Distance Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , E.row [ E.centerX, E.paddingEach { edges | top = 12 } ]
            [ EI.radioRow [ E.spacing 8 ]
                { onChange = InputDistanceFightStance
                , options = fightStanceOptions
                , selected = Just model.distanceFightStance
                , label = EI.labelHidden "fight stance"
                }
            ]
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputDistanceLevel
            , text = model.distanceLevel
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Level")
            }
        , E.el
            [ EF.size 12
            , E.paddingEach { edges | top = 4 }
            , E.transparent (strToInt model.distanceAttack > 15)
            ]
            (E.text "Level is ignored when attack <= 15")
        , EI.text [ E.width E.fill ]
            { onChange = InputDistanceSkill
            , text = model.distanceSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Distance Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputDistanceAttack
            , text = model.distanceAttack
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Attack")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputDistanceDexterity
            , text = model.distanceDexterity
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Dexterity")
            }
        , Theme.spaceY 12
        , E.html
            (H.select [ HE.onInput InputDistanceMonster, HA.style "width" "100%" ]
                (monsters
                    |> List.map
                        (\monster ->
                            let
                                ( minArm, maxArm ) =
                                    monster.arm
                            in
                            H.option [ HA.value monster.name ]
                                [ H.text monster.name
                                , H.text " Arm: "
                                , H.text (String.fromInt minArm)
                                , H.text "-"
                                , H.text (String.fromInt maxArm)
                                ]
                        )
                )
            )
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                distanceDamage
                    { level = model.distanceLevel |> String.toInt |> Maybe.withDefault 0
                    , skill = model.distanceSkill |> String.toInt |> Maybe.withDefault 0
                    , attack = model.distanceAttack |> String.toInt |> Maybe.withDefault 0
                    , stance = model.distanceFightStance
                    , dexterity = model.distanceDexterity |> String.toInt |> Maybe.withDefault 0
                    }

            dmgBlock : { min : Int, max : Int }
            dmgBlock =
                monstersDict
                    |> Dict.get model.distanceMonster
                    |> Maybe.withDefault { name = "Error", arm = ( 0, 0 ), def = ( 0, 0 ) }
                    |> (\monster ->
                            { min = Tuple.first monster.arm
                            , max = Tuple.second monster.arm
                            }
                       )

            minDamage : Float
            minDamage =
                damageRange.min - toFloat dmgBlock.max

            maxDamage : Float
            maxDamage =
                damageRange.max - toFloat dmgBlock.min
          in
          E.column [ E.spacing 4, E.paddingEach { edges | top = 8 } ]
            [ E.row [ E.spacing 32 ]
                [ E.row [ E.spacing 8 ]
                    [ E.el [ EF.bold ] (E.text "Min:")
                    , viewFloat minDamage
                    ]
                , E.row [ E.spacing 8 ]
                    [ E.el [ EF.bold ] (E.text "Max:")
                    , viewFloat maxDamage
                    ]
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Avg:")
                , viewFloat (toFloat (truncate minDamage + truncate maxDamage) / 2)
                ]
            ]
        , Theme.spaceY 4
        , let
            viewDistHitChanceRow : Int -> E.Element Msg
            viewDistHitChanceRow sqm =
                E.row [ EF.size 16 ]
                    [ E.text (String.fromInt sqm)
                    , E.text " sqm: "
                    , distanceHitChance
                        { sqm = sqm
                        , skill = model.distanceSkill |> String.toInt |> Maybe.withDefault 0
                        }
                        |> round2
                        |> String.fromFloat
                        |> E.text
                    , E.text "%"
                    ]
          in
          E.row [ E.spacing 16 ]
            [ E.column []
                (List.range 0 3
                    |> List.map viewDistHitChanceRow
                )
            , E.column [ E.alignTop ]
                (List.range 4 6
                    |> List.map viewDistHitChanceRow
                )
            ]
        ]


viewMaxBlockingDamage : Model -> E.Element Msg
viewMaxBlockingDamage model =
    E.column
        [ E.width E.fill
        , E.height (E.px 374)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Blocking Dmg")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , E.row [ E.centerX, E.paddingEach { edges | top = 12 } ]
            [ EI.radioRow [ E.spacing 8 ]
                { onChange = InputBlockingFightStance
                , options = fightStanceOptions
                , selected = Just model.blockingFightStance
                , label = EI.labelHidden "fight stance"
                }
            ]
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputBlockingSkill
            , text = model.blockingSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Blocking Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputBlockingDefense
            , text = model.blockingDefense
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Shield Defense")
            }
        , let
            maxDmgBlocked : Float
            maxDmgBlocked =
                maxDamageBlocked
                    { skill = model.blockingSkill |> String.toInt |> Maybe.withDefault 0
                    , defense = model.blockingDefense |> String.toInt |> Maybe.withDefault 0
                    , stance = model.blockingFightStance
                    }
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Min:")
                , E.text "0"
                , E.el [ EF.size 12, E.moveDown 1 ] (E.text "(never changes)")
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Max:")
                , viewFloat maxDmgBlocked
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Avg:")
                , viewFloat (toFloat (truncate maxDmgBlocked) / 2)
                ]
            ]
        ]


viewArmorReducingDamage : Model -> E.Element Msg
viewArmorReducingDamage model =
    E.column
        [ E.width E.fill
        , E.height (E.px 374)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Armor Reduced")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputTotalArmor
            , text = model.totalArmor
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Total Armor")
            }
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                reducedArmorDamage { totalArmor = model.totalArmor |> String.toInt |> Maybe.withDefault 0 }
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Min:")
                , viewFloat damageRange.min
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Max:")
                , viewFloat damageRange.max
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Avg:")
                , viewFloat (toFloat (truncate damageRange.min + truncate damageRange.max) / 2)
                ]
            ]
        ]


viewMeleeSkillCalculator : Model -> E.Element Msg
viewMeleeSkillCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 390)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Skill")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillMeleeFrom
            , text = model.skillMeleeFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillMeleeTo
            , text = model.skillMeleeTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillMeleePercentToGo
            , text = model.skillMeleePercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                meleeSkillTries
                    { from = model.skillMeleeFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.skillMeleeTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.skillMeleePercentToGo |> String.toInt |> Maybe.withDefault 0
                    , worldType = model.worldType
                    }

            minutes : Int
            minutes =
                ceiling (tries / 30)
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Tries:")
                , E.text (String.fromFloat tries)
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            ]
        ]


viewDistanceSkillCalculator : Model -> E.Element Msg
viewDistanceSkillCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 390)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Distance Skill")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillDistanceFrom
            , text = model.skillDistanceFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillDistanceTo
            , text = model.skillDistanceTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillDistancePercentToGo
            , text = model.skillDistancePercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                distanceSkillTries
                    { from = model.skillDistanceFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.skillDistanceTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.skillDistancePercentToGo |> String.toInt |> Maybe.withDefault 0
                    , worldType = model.worldType
                    }

            minutes : Int
            minutes =
                ceiling (tries / 30)
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Tries:")
                , E.text (String.fromFloat tries)
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            ]
        ]


viewBlockingSkillCalculator : Model -> E.Element Msg
viewBlockingSkillCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 416)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Blocking Skill")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillBlockingFrom
            , text = model.skillBlockingFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillBlockingTo
            , text = model.skillBlockingTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillBlockingPercentToGo
            , text = model.skillBlockingPercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                blockingSkillTries
                    { from = model.skillBlockingFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.skillBlockingTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.skillBlockingPercentToGo |> String.toInt |> Maybe.withDefault 0
                    , worldType = model.worldType
                    }

            minutes : Int
            minutes =
                ceiling (tries / 30)

            minutes2x : Int
            minutes2x =
                ceiling (tries / 30 / 2)
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Tries:")
                , E.text (String.fromFloat tries)
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "2x Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes2x // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes2x |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            ]
        ]


viewMagicLevelCalculator : Model -> E.Element Msg
viewMagicLevelCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 416)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Magic Level")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMagicLevelFrom
            , text = model.magicLevelFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMagicLevelTo
            , text = model.magicLevelTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputMagicLevelPercentToGo
            , text = model.magicLevelPercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            mana : Float
            mana =
                manaRequiredToMagicLevel
                    { from = model.magicLevelFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.magicLevelTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.magicLevelPercentToGo |> String.toInt |> Maybe.withDefault 0
                    , worldType = model.worldType
                    }

            minutes : Int
            minutes =
                manaToMinutes
                    { mana = ceiling mana
                    , worldType = model.worldType
                    }
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Mana:")
                , E.text (String.fromInt (ceiling mana))
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            ]
        ]


viewFishingSkillCalculator : Model -> E.Element Msg
viewFishingSkillCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 460)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Fishing")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillFishingFrom
            , text = model.skillFishingFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillFishingTo
            , text = model.skillFishingTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputSkillFishingPercentToGo
            , text = model.skillFishingPercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                fishingSkillTries
                    { from = model.skillFishingFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.skillFishingTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.skillFishingPercentToGo |> String.toInt |> Maybe.withDefault 0
                    , worldType = model.worldType
                    }

            minutes : Int
            minutes =
                ceiling (tries / 50 {- 50 actions per minute -})
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Tries:")
                , E.text (String.fromInt (ceiling tries))
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time (50/min):")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            , E.paragraph [ EF.size 12 ]
                [ E.text "This is the max time you will need, but in reality it will be less if you catch rare fish along the way."
                ]
            ]
        ]


viewAdvanceLevelCalculator : Model -> E.Element Msg
viewAdvanceLevelCalculator model =
    E.column
        [ E.width E.fill
        , E.height (E.px 460)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Exp Calculator")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputUpLevelFrom
            , text = model.upLevelFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputUpLevelTo
            , text = model.upLevelTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputUpPercentToGo
            , text = model.upPercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = InputUpXph
            , text = model.upXph
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Exp/hour")
            }
        , let
            expLeft : Int
            expLeft =
                expFromLevelTo
                    { from = model.upLevelFrom |> String.toInt |> Maybe.withDefault 0
                    , to = model.upLevelTo |> String.toInt |> Maybe.withDefault 0
                    , toGo = model.upPercentToGo |> String.toInt |> Maybe.withDefault 10000
                    }

            minutes : Int
            minutes =
                model.upXph
                    |> String.toInt
                    |> Maybe.withDefault 0
                    |> (\v -> ceiling ((toFloat expLeft / toFloat v) * 60))
          in
          E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
            [ E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Exp:")
                , E.text (String.fromInt expLeft)
                ]
            , E.row [ E.spacing 8 ]
                [ E.el [ EF.bold ] (E.text "Time:")
                , E.row [ E.spacing 2 ]
                    [ E.text (String.fromInt (minutes // 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "h")
                    , E.text (String.fromInt (minutes |> modBy 60))
                    , E.el [ EF.size 14, E.alignBottom ] (E.text "m")
                    ]
                ]
            ]
        ]



-- Damage Calculators


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


meleeDamage :
    { level : Int
    , skill : Int
    , attack : Int
    , stance : FightStance
    , strength : Int
    }
    -> { min : Float, max : Float }
meleeDamage { level, stance, skill, attack, strength } =
    let
        adjustedLevel : Int
        adjustedLevel =
            if attack <= 15 then
                0

            else
                level - 1

        attackFactor : Float
        attackFactor =
            case stance of
                FightStanceOffensive ->
                    1.0

                FightStanceBalanced ->
                    1.2

                FightStanceDefensive ->
                    2

        max : Float
        max =
            (25.0 + (toFloat skill ^ 2.0) / 1550.0 * toFloat attack / attackFactor) + toFloat strength * 0.35

        min : Float
        min =
            toFloat adjustedLevel / 4 + (max * 0.15) + toFloat strength * 0.3
    in
    { min = Basics.min min max
    , max = Basics.max min max
    }


distanceHitChance : { sqm : Int, skill : Int } -> Float
distanceHitChance { sqm, skill } =
    let
        ( base, modifier ) =
            case sqm of
                0 ->
                    ( 40, 0.33 )

                1 ->
                    ( 50, 0.44 )

                2 ->
                    ( 50, 0.55 )

                3 ->
                    ( 40, 0.66 )

                4 ->
                    ( 40, 0.66 )

                5 ->
                    ( 40, 0.55 )

                6 ->
                    ( 35, 0.44 )

                _ ->
                    ( -1, 0 )
    in
    base + modifier * toFloat skill


distanceDamage :
    { level : Int
    , skill : Int
    , attack : Int
    , stance : FightStance
    , dexterity : Int
    }
    -> { min : Float, max : Float }
distanceDamage { level, stance, skill, attack, dexterity } =
    let
        adjustedLevel : Int
        adjustedLevel =
            if attack <= 15 then
                0

            else
                level - 1

        attackFactor : Float
        attackFactor =
            case stance of
                FightStanceOffensive ->
                    1.0

                FightStanceBalanced ->
                    1.2

                FightStanceDefensive ->
                    2

        max : Float
        max =
            (20 + toFloat skill ^ 2 / 1600 * toFloat attack / attackFactor) + toFloat dexterity * 1.2 + toFloat skill / 2

        min : Float
        min =
            (toFloat adjustedLevel / 5 + (max * 0.2)) + toFloat dexterity * 0.8
    in
    -- TODO: should `+ max * 0.2` inside min, be `max` or `Basics.max min mac`?
    -- TODO: should dexterity add after calculate the proper min/max?
    { min = Basics.min min max
    , max = Basics.max min max
    }


maxDamageBlocked : { skill : Int, defense : Int, stance : FightStance } -> Float
maxDamageBlocked { skill, defense, stance } =
    let
        defenseFactor : Float
        defenseFactor =
            case stance of
                FightStanceOffensive ->
                    0.5

                FightStanceBalanced ->
                    0.7

                FightStanceDefensive ->
                    1
    in
    toFloat defense * toFloat skill ^ (6 / 5) * defenseFactor * 0.05 + 10


reducedArmorDamage : { totalArmor : Int } -> { min : Float, max : Float }
reducedArmorDamage { totalArmor } =
    { min = toFloat totalArmor ^ (4 / 3) * 0.27
    , max = toFloat totalArmor ^ (3 / 2) * 0.26 + 0.99
    }



-- skill Calculators


meleeSkillTries : { from : Int, to : Int, toGo : Int, worldType : WorldType } -> Float
meleeSkillTries { from, to, toGo, worldType } =
    let
        modifier : Int
        modifier =
            case worldType of
                WorldTypeSlow ->
                    1

                WorldTypeFast ->
                    4
    in
    List.range (from + 1) to
        |> List.indexedMap Tuple.pair
        |> List.foldl
            (\( index, skill ) acc ->
                if index == 0 then
                    meleeSkillTriesHelper skill
                        * (toFloat toGo / 10000)

                else
                    acc + meleeSkillTriesHelper skill
            )
            0
        |> (\v -> v / toFloat modifier)


meleeSkillTriesHelper : Int -> Float
meleeSkillTriesHelper skill =
    if skill <= 10 then
        0.0

    else
        12.5 * 2 ^ toFloat (skill - 10)


distanceSkillTries : { from : Int, to : Int, toGo : Int, worldType : WorldType } -> Float
distanceSkillTries { from, to, toGo, worldType } =
    let
        modifier : Int
        modifier =
            case worldType of
                WorldTypeSlow ->
                    1

                WorldTypeFast ->
                    4
    in
    List.range (from + 1) to
        |> List.indexedMap Tuple.pair
        |> List.foldl
            (\( index, skill ) acc ->
                if index == 0 then
                    distanceSkillTriesHelper skill
                        * (toFloat toGo / 10000)

                else
                    acc + distanceSkillTriesHelper skill
            )
            0
        |> (\v -> v / toFloat modifier)


distanceSkillTriesHelper : Int -> Float
distanceSkillTriesHelper skill =
    if skill <= 10 then
        0.0

    else
        3.125 * 2 ^ toFloat (skill - 10)


blockingSkillTries : { from : Int, to : Int, toGo : Int, worldType : WorldType } -> Float
blockingSkillTries { from, to, toGo, worldType } =
    let
        modifier : Int
        modifier =
            case worldType of
                WorldTypeSlow ->
                    1

                WorldTypeFast ->
                    4
    in
    List.range (from + 1) to
        |> List.indexedMap Tuple.pair
        |> List.foldl
            (\( index, skill ) acc ->
                if index == 0 then
                    blockingSkillTriesHelper skill
                        * (toFloat toGo / 10000)

                else
                    acc + blockingSkillTriesHelper skill
            )
            0
        |> (\v -> v / toFloat modifier)


blockingSkillTriesHelper : Int -> Float
blockingSkillTriesHelper skill =
    if skill <= 10 then
        0.0

    else
        33.333 * 1.5 ^ toFloat (skill - 10)


fishingSkillTries : { from : Int, to : Int, toGo : Int, worldType : WorldType } -> Float
fishingSkillTries { from, to, toGo, worldType } =
    let
        modifier : Int
        modifier =
            case worldType of
                WorldTypeSlow ->
                    2

                WorldTypeFast ->
                    8

        fishingSkillTriesForNextLevel : Int -> Float
        fishingSkillTriesForNextLevel skill =
            if skill < 10 then
                0

            else
                20 * 1.1 ^ (toFloat skill - 10) / toFloat modifier
    in
    List.range from (to - 1)
        |> List.indexedMap Tuple.pair
        |> List.foldl
            (\( index, skill ) acc ->
                if index == 0 then
                    fishingSkillTriesForNextLevel skill
                        * (toFloat toGo / 10000)

                else
                    acc + fishingSkillTriesForNextLevel skill
            )
            0


manaRequiredToMagicLevel : { from : Int, to : Int, toGo : Int, worldType : WorldType } -> Float
manaRequiredToMagicLevel { from, to, toGo, worldType } =
    let
        modifier : Int
        modifier =
            case worldType of
                WorldTypeSlow ->
                    1

                WorldTypeFast ->
                    3
    in
    List.range (from + 1) to
        |> List.indexedMap Tuple.pair
        |> List.foldl
            (\( index, magicLevel ) acc ->
                if index == 0 then
                    manaRequiredToMagicLevelHelper magicLevel
                        * (toFloat toGo / 100 / 100)

                else
                    acc + manaRequiredToMagicLevelHelper magicLevel
            )
            0
        |> (\v -> v / toFloat modifier)


manaRequiredToMagicLevelHelper : Int -> Float
manaRequiredToMagicLevelHelper magicLevel =
    if magicLevel <= 0 then
        0

    else
        80 * 5 ^ toFloat magicLevel


manaToMinutes : { mana : Int, worldType : WorldType } -> Int
manaToMinutes { mana, worldType } =
    case worldType of
        WorldTypeSlow ->
            ceiling (toFloat mana * 3 / 60)

        WorldTypeFast ->
            ceiling (toFloat mana * 1.5 / 60)


expFromLevelTo : { from : Int, to : Int, toGo : Int } -> Int
expFromLevelTo { from, to, toGo } =
    List.range from (to - 1)
        |> List.foldl
            (\lvl acc ->
                let
                    exp : Int
                    exp =
                        expToLevel lvl - expToLevel (lvl - 1)
                in
                if lvl == from then
                    acc + ceiling (toFloat exp * toFloat toGo / 10000)

                else
                    acc + exp
            )
            0


expToLevel : Int -> Int
expToLevel lvl =
    (((275 * (toFloat lvl ^ 4) + 85000 * (toFloat lvl ^ 3) - 1500 * (toFloat lvl ^ 2)) / 1000000) * 100 + 200 * (toFloat lvl - 1))
        |> ceiling


viewFloat : Float -> E.Element msg
viewFloat value =
    let
        intPart : Int
        intPart =
            truncate value

        decPart : Int
        decPart =
            abs (truncate ((value - toFloat intPart) * 100))
    in
    E.row []
        [ E.text (String.fromInt intPart)
        , E.el
            [ EF.size 12
            , E.moveDown 3
            , E.moveRight 1
            , EF.color Theme.grey900
            ]
            (E.text ("." ++ String.padLeft 2 '0' (String.fromInt decPart)))
        ]


fightStanceOptions : List (EI.Option FightStance x)
fightStanceOptions =
    [ EI.option FightStanceOffensive (E.text "🗡")
    , EI.option FightStanceBalanced (E.text "🗡🛡")
    , EI.option FightStanceDefensive (E.text "🛡")
    ]


round2 : Float -> Float
round2 n =
    toFloat (truncate (n * 100)) / 100


monsters : List { name : String, arm : ( Int, Int ), def : ( Int, Int ) }
monsters =
    [ { name = "Dummy", arm = ( 0, 0 ), def = ( 0, 0 ) }
    , { name = "Rat", arm = ( 0, 0 ), def = ( 0, 0 ) }
    , { name = "Cave Rat", arm = ( 0, 0 ), def = ( 0, 0 ) }
    , { name = "Troll", arm = ( 1, 3 ), def = ( 0, 1 ) }
    , { name = "Swamp Troll", arm = ( 1, 3 ), def = ( 0, 1 ) }
    , { name = "Skeleton", arm = ( 0, 0 ), def = ( 0, 4 ) }
    , { name = "Rotworm", arm = ( 3, 9 ), def = ( 0, 6 ) }
    , { name = "Orc", arm = ( 1, 3 ), def = ( 0, 3 ) }
    , { name = "Orc Spearman", arm = ( 2, 6 ), def = ( 0, 7 ) }
    , { name = "Mutated Rat", arm = ( 6, 18 ), def = ( 0, 9 ) }
    , { name = "Minotaur", arm = ( 5, 14 ), def = ( 0, 6 ) }
    , { name = "Minotaur Archer", arm = ( 3, 8 ), def = ( 0, 3 ) }
    , { name = "Elf", arm = ( 2, 6 ), def = ( 0, 7 ) }
    , { name = "Witch", arm = ( 3, 9 ), def = ( 0, 7 ) }
    , { name = "Ghoul", arm = ( 3, 9 ), def = ( 0, 14 ) }
    , { name = "Elf Scout", arm = ( 3, 8 ), def = ( 0, 16 ) }
    , { name = "Minotaur Mage", arm = ( 8, 24 ), def = ( 0, 61 ) }
    , { name = "Elf Arcanist", arm = ( 7, 20 ), def = ( 0, 20 ) }
    , { name = "Bonebeast", arm = ( 19, 56 ), def = ( 0, 101 ) }
    , { name = "Fledgling Dragon", arm = ( 11, 33 ), def = ( 0, 54 ) }
    ]


monstersDict : Dict String { name : String, arm : ( Int, Int ), def : ( Int, Int ) }
monstersDict =
    monsters
        |> List.foldl
            (\monster acc ->
                Dict.insert monster.name monster acc
            )
            Dict.empty


strToInt : String -> Int
strToInt str =
    String.toInt str
        |> Maybe.withDefault 0
