module Evergreen.V2.Page.Home exposing (..)


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


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


type Msg
    = InputMeleeFightStance FightStance
    | InputMeleeLevel Int
    | InputMeleeSkill Int
    | InputMeleeAttack Int
    | InputDistanceFightStance FightStance
    | InputDistanceLevel Int
    | InputDistanceSkill Int
    | InputDistanceAttack Int
