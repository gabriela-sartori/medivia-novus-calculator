module Evergreen.V6.Page.Home exposing (..)


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


type WorldType
    = WorldTypeSlow
    | WorldTypeFast


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
