module Currency exposing (Currency, fromInt, fromString, fromFloat, toString)

type Currency = Currency String


fromInt : Int -> Currency
fromInt int = Currency <| String.fromInt int

fromString : String -> Currency
fromString string = Currency string

fromFloat : Float -> Currency
fromFloat float = Currency <| String.fromFloat float

toString : Currency -> String
toString currency =
    case currency of
       Currency string -> string
