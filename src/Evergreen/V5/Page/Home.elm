module Evergreen.V5.Page.Home exposing (..)


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


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
    }


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
