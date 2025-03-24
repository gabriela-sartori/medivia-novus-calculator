module Evergreen.V23.Page.Home exposing (..)


type FightStance
    = FightStanceOffensive
    | FightStanceBalanced
    | FightStanceDefensive


type WorldType
    = WorldTypeSlow
    | WorldTypeFast


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
