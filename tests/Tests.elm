module Tests exposing (all)

import Expect
import HitType
import Measurement exposing (getHit)
import Parameter
import Test exposing (..)


all : Test
all =
    describe "Check Analytics requests"
        [ test "pageview" <|
            \_ ->
                getHit
                    { hitType = HitType.Pageview
                    , trackingId = "UA-XXXXX-Y"
                    , clientId = "555"
                    , payload = [ ( Parameter.DocumentPath, "/home" ) ]
                    }
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=pageview&dp=%2Fhome"
        , test "generic hit" <|
            \_ ->
                getHit
                    { hitType = HitType.Pageview
                    , trackingId = "UA-123456-1"
                    , clientId = "5555"
                    , payload = [ ( Parameter.DocumentPath, "/pageA" ) ]
                    }
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-123456-1&cid=5555&t=pageview&dp=%2FpageA"
        ]
