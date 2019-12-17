module Tests exposing (all)

import Expect
import Http
import Measurement exposing (hit)
import Test exposing (..)


all : Test
all =
    describe "Check Analytics requests"
        [ test "pageview" <|
            \_ ->
                hit Measurement.Pageview "UA-XXXXX-Y" "555" [ ( "dp", "/home" ) ]
                    |> Expect.equal
                        ( "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=pageview&dp=%2Fhome"
                        , Http.emptyBody
                        )
        , test "generic hit" <|
            \_ ->
                hit Measurement.Pageview "UA-123456-1" "5555" [ ( "dp", "/pageA" ) ]
                    |> Expect.equal
                        ( "https://www.google-analytics.com/collect?v=1&tid=UA-123456-1&cid=5555&t=pageview&dp=%2FpageA"
                        , Http.emptyBody
                        )
        ]
