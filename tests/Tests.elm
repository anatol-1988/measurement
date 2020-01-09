module Tests exposing (all)

import Expect
import HitType
import Http
import Measurement exposing (getHit, postHit)
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
                    , payload = [ Parameter.DocumentPath "/home" ]
                    }
                    |> .url
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=pageview&dp=%2Fhome"
        , test "generic GET hit" <|
            \_ ->
                getHit
                    { hitType = HitType.Pageview
                    , trackingId = "UA-123456-1"
                    , clientId = "5555"
                    , payload = [ Parameter.DocumentPath "/pageA" ]
                    }
                    |> .url
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-123456-1&cid=5555&t=pageview&dp=%2FpageA"
        , test "generic POST hit" <|
            \_ ->
                postHit
                    { hitType = HitType.Pageview
                    , trackingId = "UA-123456-1"
                    , clientId = "5555"
                    , payload = [ Parameter.DocumentPath "/pageA" ]
                    }
                    |> .url
                    |> Expect.equal "https://www.google-analytics.com/collect"
        ]
