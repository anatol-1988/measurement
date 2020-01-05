module HitType exposing (HitType(..), toString)


type HitType
    = Pageview
    | Screenview
    | Event
    | Transaction
    | Item
    | Social
    | Exception
    | Timing


toString : HitType -> String
toString hitType =
    case hitType of
        Pageview ->
            "pageview"

        Screenview ->
            "screenview"

        Event ->
            "event"

        Transaction ->
            "transaction"

        Item ->
            "item"

        Social ->
            "social"

        Exception ->
            "exception"

        Timing ->
            "timing"
