module Tests exposing (all)

import Expect
import HitType
import Measurement exposing (hit)
import Parameter
import Test exposing (..)


all : Test
all =
    describe "Check Analytics requests"
        [ test "pageview" <|
            \_ ->
                hit HitType.Pageview
                    "UA-XXXXX-Y"
                    "555"
                    [ ( Parameter.DocumentPath, "/home" ) ]
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=pageview&dp=%2Fhome"
        , test "generic hit" <|
            \_ ->
                hit HitType.Pageview
                    "UA-123456-1"
                    "5555"
                    [ ( Parameter.DocumentPath, "/pageA" ) ]
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-123456-1&cid=5555&t=pageview&dp=%2FpageA"
        ]
