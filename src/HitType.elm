module HitType exposing (HitType(..))

{-| The type of hit


# Hit types

@docs HitType

-}


{-| Type of hit
-}
type HitType
    = Pageview
    | Screenview
    | Event
    | Transaction
    | Item
    | Social
    | Exception
    | Timing
