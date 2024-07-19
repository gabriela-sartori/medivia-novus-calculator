module Page.Home exposing (Model, Msg, init, subscriptions, update, view)

import Bridge
import Element as E
import Element.Border as EBO
import Element.Font as EF
import Element.Input as EI
import Shared
import Theme exposing (edges)


type alias Model =
    { meleeFightStance : FightStance
    , meleeLevel : Int
    , meleeSkill : Int
    , meleeAttack : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { meleeFightStance = FightStanceOffensive
      , meleeLevel = 1
      , meleeSkill = 10
      , meleeAttack = 10
      }
    , Cmd.none
    )


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel Int
    | InputMeleeSkill Int
    | InputMeleeAttack Int


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
            , E.height (E.px 430)
            , E.padding 16
            , EBO.width 1
            , EBO.rounded 4
            ]
            [ E.el [ EF.bold, EF.size 24, E.centerX ] (E.text "Melee Calculator")
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
                , label = EI.labelAbove [] (E.text "Skill")
                }
            , Theme.spaceY 12
            , EI.text [ E.width E.fill ]
                { onChange = String.toInt >> Maybe.withDefault 10 >> InputMeleeAttack
                , text = String.fromInt model.meleeAttack
                , placeholder = Nothing
                , label = EI.labelAbove [] (E.text "Attack")
                }
            , let
                damageRange : { min : Float, max : Float }
                damageRange =
                    meleeDamage
                        { level = model.meleeLevel
                        , skill = model.meleeSkill
                        , attack = model.meleeAttack
                        , stance = model.meleeFightStance
                        }
              in
              E.column [ E.paddingEach { edges | top = 12 }, E.spacing 8 ]
                [ E.row []
                    [ E.el [ EF.bold ] (E.text "Min: ")
                    , E.text (String.fromFloat damageRange.min)
                    ]
                , E.row []
                    [ E.el [ EF.bold ] (E.text "Max: ")
                    , E.text (String.fromFloat damageRange.max)
                    ]
                ]
            ]
        ]



-- Calculators


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


meleeDamage : { level : Int, skill : Int, attack : Int, stance : FightStance } -> { min : Float, max : Float }
meleeDamage { level, stance, skill, attack } =
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
            25.0 + (toFloat skill ^ 2.0) / 1550.0 * toFloat attack / attackFactor

        min : Float
        min =
            toFloat level / 4 + (max * 0.15)
    in
    { min = round2 (Basics.min min max)
    , max = round2 (Basics.max min max)
    }


round2 : Float -> Float
round2 value =
    toFloat (round (value * 100)) / 100
