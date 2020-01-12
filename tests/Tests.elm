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
        , test "event tracking" <|
            \_ ->
                getHit
                    { hitType = HitType.Event
                    , trackingId = "UA-XXXXX-Y"
                    , clientId = "555"
                    , payload =
                        [ Parameter.EventCategory "video"
                        , Parameter.EventAction "play"
                        , Parameter.EventLabel "holiday"
                        , Parameter.EventValue 300
                        ]
                    }
                    |> .url
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=event&ec=video&ea=play&el=holiday&ev=300"
        , test "Measuring Impressions" <|
            \_ ->
                getHit
                    { hitType = HitType.Pageview
                    , trackingId = "UA-XXXXX-Y"
                    , clientId = "555"
                    , payload =
                        [ Parameter.DocumentHostName "mydemo.com"
                        , Parameter.DocumentPath "/home"
                        , Parameter.DocumentTitle "homepage"
                        , Parameter.ProductImpressionListName 1 "Search Results"
                        , Parameter.ProductImpressionSKU 1 1 "P12345"
                        , Parameter.ProductImpressionName 1 1 "Android Warhol T-Shirt"
                        , Parameter.ProductImpressionCategory 1 1 "Apparel/T-Shirts"
                        , Parameter.ProductImpressionBrand 1 1 "Google"
                        , Parameter.ProductImpressionVariant 1 1 "Black"
                        , Parameter.ProductImpressionPosition 1 1 1
                        , Parameter.ProductImpressionCustomDimension 1 1 1 "Member"
                        , Parameter.ProductImpressionListName 2 "Recommended Products"
                        , Parameter.ProductImpressionName 2 1 "Yellow T-Shirt"
                        , Parameter.ProductImpressionName 2 2 "Red T-Shirt"
                        ]
                    }
                    |> .url
                    |> Expect.equal
                        "https://www.google-analytics.com/collect?v=1&tid=UA-XXXXX-Y&cid=555&t=pageview&dh=mydemo.com&dp=%2Fhome&dt=homepage&il1nm=Search%20Results&il1pi1id=P12345&il1pi1nm=Android%20Warhol%20T-Shirt&il1pi1ca=Apparel%2FT-Shirts&il1pi1br=Google&il1pi1va=Black&il1pi1ps=1&il1pi1cd1=Member&il2nm=Recommended%20Products&il2pi1nm=Yellow%20T-Shirt&il2pi2nm=Red%20T-Shirt"
        ]
