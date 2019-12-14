module Tests exposing (all)

import Expect
import Http
import Measurement exposing (request)
import Test exposing (..)


all : Test
all =
    describe "Check Analytics requests"
        [ test "pageview" <|
            \_ ->
                request Measurement.Pageview "UA-XXXXX-Y" "555" "/home"
                    |> Expect.equal
                        ( "https://www.google-analytics.com/collect?v=1&t=pageview&tid=UA-XXXXX-Y&cid=555&dp=%2Fhome"
                        , Http.emptyBody
                        )
        ]
