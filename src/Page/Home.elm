module Page.Home exposing (FightStance(..), Model, Msg, init, subscriptions, update, view)

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
    , distanceFightStance : FightStance
    , distanceLevel : Int
    , distanceSkill : Int
    , distanceAttack : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { meleeFightStance = FightStanceOffensive
      , meleeLevel = 1
      , meleeSkill = 10
      , meleeAttack = 10
      , distanceFightStance = FightStanceOffensive
      , distanceLevel = 1
      , distanceSkill = 10
      , distanceAttack = 10
      }
    , Cmd.none
    )


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel Int
    | InputMeleeSkill Int
    | InputMeleeAttack Int
    | InputDistanceFightStance FightStance
    | InputDistanceLevel Int
    | InputDistanceSkill Int
    | InputDistanceAttack Int


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

        InputDistanceFightStance stance ->
            ( { model | distanceFightStance = stance }, Cmd.none )

        InputDistanceLevel value ->
            ( { model | distanceLevel = value }, Cmd.none )

        InputDistanceSkill value ->
            ( { model | distanceSkill = value }, Cmd.none )

        InputDistanceAttack value ->
            ( { model | distanceAttack = value }, Cmd.none )


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
        [ E.row []
            [ viewMeleeDamage model
            , Theme.spaceX 16
            , viewDistanceDamage model
            ]
        ]


viewMeleeDamage : Model -> E.Element Msg
viewMeleeDamage model =
    E.column
        [ E.width (E.px 400)
        , E.height (E.px 430)
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
        , E.height (E.px 430)
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
        , let
            damageRange : { min : Float, max : Float }
            damageRange =
                distanceDamage
                    { level = model.distanceLevel
                    , skill = model.distanceSkill
                    , attack = model.distanceAttack
                    , stance = model.distanceFightStance
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
    { min = Basics.min min max
    , max = Basics.max min max
    }


distanceDamage : { level : Int, skill : Int, attack : Int, stance : FightStance } -> { min : Float, max : Float }
distanceDamage { level, stance, skill, attack } =
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
            20 + toFloat skill ^ 2 / 1600 * toFloat attack / attackFactor

        min : Float
        min =
            toFloat level / 5 + (max * 0.2)
    in
    { min = Basics.min min max
    , max = Basics.max min max
    }



-- Helpers


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
