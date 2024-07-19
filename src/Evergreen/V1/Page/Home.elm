module Evergreen.V1.Page.Home exposing (..)


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


type alias Model =
    { meleeFightStance : FightStance
    , meleeLevel : Int
    , meleeSkill : Int
    , meleeAttack : Int
    }


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel Int
    | InputMeleeSkill Int
    | InputMeleeAttack Int
