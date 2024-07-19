module Evergreen.Migrate.V2 exposing (..)

{-| This migration file was automatically generated by the lamdera compiler.

It includes:

  - A migration for each of the 6 Lamdera core types that has changed
  - A function named `migrate_ModuleName_TypeName` for each changed/custom type

Expect to see:

  - `Unimplementеd` values as placeholders wherever I was unable to figure out a clear migration path for you
  - `@NOTICE` comments for things you should know about, i.e. new custom type constructors that won't get any
    value mappings from the old type by default

You can edit this file however you wish! It won't be generated again.

See <https://dashboard.lamdera.app/docs/evergreen> for more info.

-}

import Evergreen.V1.Page
import Evergreen.V1.Page.Home
import Evergreen.V1.Shared
import Evergreen.V1.Types
import Evergreen.V2.Page
import Evergreen.V2.Page.Home
import Evergreen.V2.Shared
import Evergreen.V2.Types
import Lamdera.Migrations exposing (..)


frontendModel : Evergreen.V1.Types.FrontendModel -> ModelMigration Evergreen.V2.Types.FrontendModel Evergreen.V2.Types.FrontendMsg
frontendModel old =
    ModelMigrated ( migrate_Types_FrontendModel old, Cmd.none )


backendModel : Evergreen.V1.Types.BackendModel -> ModelMigration Evergreen.V2.Types.BackendModel Evergreen.V2.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V1.Types.FrontendMsg -> MsgMigration Evergreen.V2.Types.FrontendMsg Evergreen.V2.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V1.Types.ToBackend -> MsgMigration Evergreen.V2.Types.ToBackend Evergreen.V2.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V1.Types.BackendMsg -> MsgMigration Evergreen.V2.Types.BackendMsg Evergreen.V2.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V1.Types.ToFrontend -> MsgMigration Evergreen.V2.Types.ToFrontend Evergreen.V2.Types.FrontendMsg
toFrontend old =
    MsgMigrated ( migrate_Types_ToFrontend old, Cmd.none )


migrate_Types_FrontendModel : Evergreen.V1.Types.FrontendModel -> Evergreen.V2.Types.FrontendModel
migrate_Types_FrontendModel old =
    { page = old.page |> migrate_Page_Model
    , shared = old.shared |> migrate_Shared_Model
    }


migrate_Page_Home_FightStance : Evergreen.V1.Page.Home.FightStance -> Evergreen.V2.Page.Home.FightStance
migrate_Page_Home_FightStance old =
    case old of
        Evergreen.V1.Page.Home.FightStanceOffensive ->
            Evergreen.V2.Page.Home.FightStanceOffensive

        Evergreen.V1.Page.Home.FightStanceBalanced ->
            Evergreen.V2.Page.Home.FightStanceBalanced

        Evergreen.V1.Page.Home.FightStanceDefensive ->
            Evergreen.V2.Page.Home.FightStanceDefensive


migrate_Page_Home_Model : Evergreen.V1.Page.Home.Model -> Evergreen.V2.Page.Home.Model
migrate_Page_Home_Model old =
    { meleeFightStance = old.meleeFightStance |> migrate_Page_Home_FightStance
    , meleeLevel = old.meleeLevel
    , meleeSkill = old.meleeSkill
    , meleeAttack = old.meleeAttack
    , distanceFightStance = old.meleeFightStance
    , distanceLevel = 0
    , distanceSkill = 0
    , distanceAttack = 0
    }


migrate_Page_Home_Msg : Evergreen.V1.Page.Home.Msg -> Evergreen.V2.Page.Home.Msg
migrate_Page_Home_Msg old =
    case old of
        Evergreen.V1.Page.Home.InputMeleeFightStance p0 ->
            Evergreen.V2.Page.Home.InputMeleeFightStance (p0 |> migrate_Page_Home_FightStance)

        Evergreen.V1.Page.Home.InputMeleeLevel p0 ->
            Evergreen.V2.Page.Home.InputMeleeLevel p0

        Evergreen.V1.Page.Home.InputMeleeSkill p0 ->
            Evergreen.V2.Page.Home.InputMeleeSkill p0

        Evergreen.V1.Page.Home.InputMeleeAttack p0 ->
            Evergreen.V2.Page.Home.InputMeleeAttack p0


migrate_Page_Model : Evergreen.V1.Page.Model -> Evergreen.V2.Page.Model
migrate_Page_Model old =
    case old of
        Evergreen.V1.Page.Home p0 ->
            Evergreen.V2.Page.Home (p0 |> migrate_Page_Home_Model)

        Evergreen.V1.Page.NotFound ->
            Evergreen.V2.Page.NotFound


migrate_Page_Msg : Evergreen.V1.Page.Msg -> Evergreen.V2.Page.Msg
migrate_Page_Msg old =
    case old of
        Evergreen.V1.Page.HomeMsg p0 ->
            Evergreen.V2.Page.HomeMsg (p0 |> migrate_Page_Home_Msg)


migrate_Shared_Model : Evergreen.V1.Shared.Model -> Evergreen.V2.Shared.Model
migrate_Shared_Model old =
    old


migrate_Shared_Msg : Evergreen.V1.Shared.Msg -> Evergreen.V2.Shared.Msg
migrate_Shared_Msg old =
    case old of
        Evergreen.V1.Shared.GotViewport p0 ->
            Evergreen.V2.Shared.GotViewport p0

        Evergreen.V1.Shared.OnResize p0 p1 ->
            Evergreen.V2.Shared.OnResize p0 p1

        Evergreen.V1.Shared.GotZone p0 ->
            Evergreen.V2.Shared.GotZone p0


migrate_Types_FrontendMsg : Evergreen.V1.Types.FrontendMsg -> Evergreen.V2.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V1.Types.FrontendMsg_DoNothing ->
            Evergreen.V2.Types.FrontendMsg_DoNothing

        Evergreen.V1.Types.FrontendMsg_UrlClicked p0 ->
            Evergreen.V2.Types.FrontendMsg_UrlClicked p0

        Evergreen.V1.Types.FrontendMsg_UrlChanged p0 ->
            Evergreen.V2.Types.FrontendMsg_UrlChanged p0

        Evergreen.V1.Types.FrontendMsg_PageMsg p0 ->
            Evergreen.V2.Types.FrontendMsg_PageMsg (p0 |> migrate_Page_Msg)

        Evergreen.V1.Types.FrontendMsg_SharedMsg p0 ->
            Evergreen.V2.Types.FrontendMsg_SharedMsg (p0 |> migrate_Shared_Msg)


migrate_Types_ToFrontend : Evergreen.V1.Types.ToFrontend -> Evergreen.V2.Types.ToFrontend
migrate_Types_ToFrontend old =
    case old of
        Evergreen.V1.Types.ToFrontend_DoNothing ->
            Evergreen.V2.Types.ToFrontend_DoNothing

        Evergreen.V1.Types.ToFrontend_PageMsg p0 ->
            Evergreen.V2.Types.ToFrontend_PageMsg (p0 |> migrate_Page_Msg)
