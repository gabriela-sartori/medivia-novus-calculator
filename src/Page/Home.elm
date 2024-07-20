module Page.Home exposing (FightStance(..), Model, Msg(..), init, subscriptions, update, view)

import Element as E
import Element.Border as EBO
import Element.Font as EF
import Element.Input as EI
import Html.Attributes as HA
import Shared
import Theme exposing (edges)


type alias Model =
    { meleeFightStance : FightStance
    , meleeLevel : Int
    , meleeSkill : Int
    , meleeAttack : Int
    , meleeStrength : Int
    , distanceFightStance : FightStance
    , distanceLevel : Int
    , distanceSkill : Int
    , distanceAttack : Int
    , distanceDexterity : Int
    , blockingFightStance : FightStance
    , blockingSkill : Int
    , blockingDefense : Int
    , totalArmor : Int
    , worldType : WorldType
    , skillDistanceFrom : Int
    , skillDistanceTo : Int
    , skillDistancePercentToGo : Int
    , skillMeleeFrom : Int
    , skillMeleeTo : Int
    , skillMeleePercentToGo : Int
    , skillBlockingFrom : Int
    , skillBlockingTo : Int
    , skillBlockingPercentToGo : Int
    , magicLevelFrom : Int
    , magicLevelTo : Int
    , magicLevelPercentToGo : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { meleeFightStance = FightStanceOffensive
      , meleeLevel = 1
      , meleeSkill = 10
      , meleeAttack = 10
      , meleeStrength = 0
      , distanceFightStance = FightStanceOffensive
      , distanceLevel = 1
      , distanceSkill = 10
      , distanceAttack = 10
      , distanceDexterity = 0
      , blockingFightStance = FightStanceDefensive
      , blockingSkill = 10
      , blockingDefense = 10
      , totalArmor = 25
      , worldType = WorldTypeFast
      , skillDistanceFrom = 10
      , skillDistanceTo = 11
      , skillDistancePercentToGo = 10000
      , skillMeleeFrom = 10
      , skillMeleeTo = 11
      , skillMeleePercentToGo = 10000
      , skillBlockingFrom = 10
      , skillBlockingTo = 11
      , skillBlockingPercentToGo = 10000
      , magicLevelFrom = 0
      , magicLevelTo = 5
      , magicLevelPercentToGo = 10000
      }
    , Cmd.none
    )


type WorldType
    = WorldTypeSlow
    | WorldTypeFast


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel Int
    | InputMeleeSkill Int
    | InputMeleeAttack Int
    | InputMeleeStrength Int
    | InputDistanceFightStance FightStance
    | InputDistanceLevel Int
    | InputDistanceSkill Int
    | InputDistanceAttack Int
    | InputDistanceDexterity Int
    | InputBlockingFightStance FightStance
    | InputBlockingSkill Int
    | InputBlockingDefense Int
    | InputTotalArmor Int
    | InputWorldType WorldType
    | InputSkillDistanceFrom Int
    | InputSkillDistanceTo Int
    | InputSkillDistancePercentToGo Int
    | InputSkillMeleeFrom Int
    | InputSkillMeleeTo Int
    | InputSkillMeleePercentToGo Int
    | InputSkillBlockingFrom Int
    | InputSkillBlockingTo Int
    | InputSkillBlockingPercentToGo Int
    | InputMagicLevelFrom Int
    | InputMagicLevelTo Int
    | InputMagicLevelPercentToGo Int


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
            ( { model | skillDistancePercentToGo = max 0 (min 10000 value) }, Cmd.none )

        InputSkillMeleeFrom value ->
            ( { model | skillMeleeFrom = value }, Cmd.none )

        InputSkillMeleeTo value ->
            ( { model | skillMeleeTo = value }, Cmd.none )

        InputSkillMeleePercentToGo value ->
            ( { model | skillMeleePercentToGo = max 0 (min 10000 value) }, Cmd.none )

        InputSkillBlockingFrom value ->
            ( { model | skillBlockingFrom = value }, Cmd.none )

        InputSkillBlockingTo value ->
            ( { model | skillBlockingTo = value }, Cmd.none )

        InputSkillBlockingPercentToGo value ->
            ( { model | skillBlockingPercentToGo = max 0 (min 10000 value) }, Cmd.none )

        InputMagicLevelFrom value ->
            ( { model | magicLevelFrom = value }, Cmd.none )

        InputMagicLevelTo value ->
            ( { model | magicLevelTo = value }, Cmd.none )

        InputMagicLevelPercentToGo value ->
            ( { model | magicLevelPercentToGo = max 0 (min 10000 value) }, Cmd.none )


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
    E.column
        [ E.centerX
        , E.padding 32
        ]
        [ E.el [ EF.bold, EF.size 30, E.centerX ] (E.text "Medivia Novus Calculator")
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
        , E.wrappedRow [ E.spacing 32 ]
            [ viewMeleeDamage model
            , viewDistanceDamage model
            ]
        , Theme.spaceY 32
        , E.wrappedRow [ E.spacing 32 ]
            [ viewMaxBlockingDamage model
            , viewArmorReducingDamage model
            ]
        , Theme.spaceY 32
        , E.el [ EF.bold, EF.size 26, E.centerX ] (E.text "Skills")
        , Theme.spaceY 16
        , E.column [ E.centerX ]
            [ EI.radioRow [ E.spacing 8 ]
                { onChange = InputWorldType
                , options =
                    [ EI.option WorldTypeSlow (E.text "1x skills and ML")
                    , EI.option WorldTypeFast (E.text "4x skills, 3x ML, 2x regen")
                    ]
                , selected = Just model.worldType
                , label = EI.labelHidden "world type"
                }
            ]
        , Theme.spaceY 16
        , E.wrappedRow [ E.spacing 32 ]
            [ viewMeleeSkillCalculator model
            , viewDistanceSkillCalculator model
            ]
        , Theme.spaceY 32
        , E.wrappedRow [ E.spacing 32 ]
            [ viewMagicLevelCalculator model
            ]
        ]


viewMeleeDamage : Model -> E.Element Msg
viewMeleeDamage model =
    E.column
        [ E.width (E.px 400)
        , E.height (E.px 510)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , EI.radioRow [ E.spacing 8 ]
            { onChange = InputMeleeFightStance
            , options =
                [ EI.option FightStanceOffensive (E.text "Offensive")
                , EI.option FightStanceBalanced (E.text "Balanced")
                , EI.option FightStanceDefensive (E.text "Deffensive")
                ]
            , selected = Just model.meleeFightStance
            , label = EI.labelAbove [ E.paddingEach { edges | bottom = 8 } ] (E.text "Stance")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 1 >> InputMeleeLevel
            , text = String.fromInt model.meleeLevel
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Level")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputMeleeSkill
            , text = String.fromInt model.meleeSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Melee Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputMeleeAttack
            , text = String.fromInt model.meleeAttack
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Attack")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 0 >> InputMeleeStrength
            , text = String.fromInt model.meleeStrength
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Strength")
            }
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                meleeDamage
                    { level = model.meleeLevel
                    , skill = model.meleeSkill
                    , attack = model.meleeAttack
                    , stance = model.meleeFightStance
                    , strength = model.meleeStrength
                    }
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
            ]
        ]


viewDistanceDamage : Model -> E.Element Msg
viewDistanceDamage model =
    E.column
        [ E.width (E.px 400)
        , E.height (E.px 510)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Distance Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , EI.radioRow [ E.spacing 8 ]
            { onChange = InputDistanceFightStance
            , options =
                [ EI.option FightStanceOffensive (E.text "Offensive")
                , EI.option FightStanceBalanced (E.text "Balanced")
                , EI.option FightStanceDefensive (E.text "Deffensive")
                ]
            , selected = Just model.distanceFightStance
            , label = EI.labelAbove [ E.paddingEach { edges | bottom = 8 } ] (E.text "Stance")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 1 >> InputDistanceLevel
            , text = String.fromInt model.distanceLevel
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Level")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputDistanceSkill
            , text = String.fromInt model.distanceSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Distance Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputDistanceAttack
            , text = String.fromInt model.distanceAttack
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Attack")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 0 >> InputDistanceDexterity
            , text = String.fromInt model.distanceDexterity
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Dexterity")
            }
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                distanceDamage
                    { level = model.distanceLevel
                    , skill = model.distanceSkill
                    , attack = model.distanceAttack
                    , stance = model.distanceFightStance
                    , dexterity = model.distanceDexterity
                    }
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
            ]
        ]


viewMaxBlockingDamage : Model -> E.Element Msg
viewMaxBlockingDamage model =
    E.column
        [ E.width (E.px 400)
        , E.height (E.px 374)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Blocking Reduced Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , EI.radioRow [ E.spacing 8 ]
            { onChange = InputBlockingFightStance
            , options =
                [ EI.option FightStanceOffensive (E.text "Offensive")
                , EI.option FightStanceBalanced (E.text "Balanced")
                , EI.option FightStanceDefensive (E.text "Deffensive")
                ]
            , selected = Just model.blockingFightStance
            , label = EI.labelAbove [ E.paddingEach { edges | bottom = 8 } ] (E.text "Stance")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputBlockingSkill
            , text = String.fromInt model.blockingSkill
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Blocking Skill")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputBlockingDefense
            , text = String.fromInt model.blockingDefense
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Shield Defense")
            }
        , let
            maxDmgBlocked : Float
            maxDmgBlocked =
                maxDamageBlocked
                    { skill = model.blockingSkill
                    , defense = model.blockingDefense
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
        [ E.width (E.px 400)
        , E.height (E.px 374)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Armor Reduced Damage")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 1 >> InputTotalArmor
            , text = String.fromInt model.totalArmor
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "Total Armor")
            }
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                reducedArmorDamage { totalArmor = model.totalArmor }
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
        [ E.width (E.px 400)
        , E.height (E.px 390)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Skill")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputSkillMeleeFrom
            , text = String.fromInt model.skillMeleeFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 20 >> InputSkillMeleeTo
            , text = String.fromInt model.skillMeleeTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 20 >> InputSkillMeleePercentToGo
            , text = String.fromInt model.skillMeleePercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                meleeSkillTries
                    { from = model.skillMeleeFrom
                    , to = model.skillMeleeTo
                    , toGo = model.skillMeleePercentToGo
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
        [ E.width (E.px 400)
        , E.height (E.px 390)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Distance Skill")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputSkillDistanceFrom
            , text = String.fromInt model.skillDistanceFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 20 >> InputSkillDistanceTo
            , text = String.fromInt model.skillDistanceTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 20 >> InputSkillDistancePercentToGo
            , text = String.fromInt model.skillDistancePercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            tries : Float
            tries =
                distanceSkillTries
                    { from = model.skillDistanceFrom
                    , to = model.skillDistanceTo
                    , toGo = model.skillDistancePercentToGo
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


viewMagicLevelCalculator : Model -> E.Element Msg
viewMagicLevelCalculator model =
    E.column
        [ E.width (E.px 400)
        , E.height (E.px 390)
        , E.padding 16
        , EBO.width 1
        , EBO.rounded 4
        ]
        [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Magic Level")
        , E.el [ EF.bold, EF.size 12, EF.color Theme.red, E.centerX ] (E.text "Alpha")
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10 >> InputMagicLevelFrom
            , text = String.fromInt model.magicLevelFrom
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "From")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 20 >> InputMagicLevelTo
            , text = String.fromInt model.magicLevelTo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "To")
            }
        , Theme.spaceY 12
        , EI.text [ E.width E.fill ]
            { onChange = String.toInt >> Maybe.withDefault 10000 >> InputMagicLevelPercentToGo
            , text = String.fromInt model.magicLevelPercentToGo
            , placeholder = Nothing
            , label = EI.labelAbove [] (E.text "% To Go")
            }
        , Theme.spaceY 12
        , let
            mana : Float
            mana =
                manaRequiredToMagicLevel
                    { from = model.magicLevelFrom
                    , to = model.magicLevelTo
                    , toGo = model.magicLevelPercentToGo
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
            toFloat level / 4 + (max * 0.15) + toFloat strength * 0.3
    in
    { min = Basics.min min max
    , max = Basics.max min max
    }


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
            (20 + toFloat skill ^ 2 / 1600 * toFloat attack / attackFactor) + toFloat dexterity * 1.2

        min : Float
        min =
            (toFloat level / 5 + (max * 0.2)) + toFloat dexterity * 0.8
    in
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
    , max = toFloat totalArmor ^ (3 / 2) * 0.26
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
        80 * 5 ^ toFloat (magicLevel - 0)


manaToMinutes : { mana : Int, worldType : WorldType } -> Int
manaToMinutes { mana, worldType } =
    case worldType of
        WorldTypeSlow ->
            ceiling (toFloat mana * 3 / 60)

        WorldTypeFast ->
            ceiling (toFloat mana * 1.5 / 60)


viewFloat : Float -> E.Element msg
viewFloat value =
    let
        intPart : Int
        intPart =
            truncate value

        decPart : Int
        decPart =
            truncate ((value - toFloat intPart) * 100)
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
