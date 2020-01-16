module Measurement exposing
    ( get, post, batch
    , event, pageview, Parameter
    )

{-| This module implements Google protocol for Analytics. You can find its
description on <https://developers.google.com/analytics/devguides/collection/protocol/v1>


# Request constructors

@docs get, post, batch, Parameter


# Helpers

@docs event, pageview

-}

import HitType exposing (HitType)
import Http
import Parameter
import Url.Builder as Url


type Msg
    = Measured (Result Http.Error ())

{-| Measurement Protocol Parameter
-}
type alias Parameter =
    Parameter.Parameter

type alias Hit =
    { hitType : HitType
    , trackingId : String
    , clientId : String
    , payload : List Parameter
    }


{-| Sends hit to GA using POST GET request

    get
        { hitType = HitType.Event
        , trackingId = "UA-XXXXX-Y"
        , clientId = "555"
        , payload =
            [ Parameter.CacheBuster "289372387623"
            , Parameter.EventCategory "video"
            , Parameter.EventAction "play"
            , Parameter.EventLabel "holiday"
            , Parameter.EventValue 300
            ]
        }
        |> Http.get

-}
get : Hit -> { expect : Http.Expect Msg, url : String }
get hit =
    let
        url =
            payloadToQuery hit
    in
    { expect = Http.expectWhatever Measured
    , url = "https://www.google-analytics.com/collect?" ++ url
    }


{-| Sends hit to GA using POST HTTP request

    post
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
        |> Http.post

-}
post : Hit -> { url : String, body : Http.Body, expect : Http.Expect Msg }
post hit =
    { url = "https://www.google-analytics.com/collect"
    , body = Http.stringBody "" <| payloadToQuery hit
    , expect = Http.expectWhatever Measured
    }


payloadToQuery : Hit -> String
payloadToQuery hit =
    let
        payload =
            [ Parameter.toQuery <| Parameter.ProtocolVersion "1"
            , Parameter.toQuery <| Parameter.TrackingID hit.trackingId
            , Parameter.toQuery <| Parameter.ClientID hit.clientId
            , Parameter.toQuery <| Parameter.Hittype hit.hitType
            ]
                ++ List.map
                    (\param -> Parameter.toQuery param)
                    hit.payload
    in
    String.dropLeft 1 <| Url.toQuery payload


{-| Batching multiple hits in a single request
    
    batch
      [ { hitType = HitType.Event
        , trackingId = "UA-XXXXX-Y"
        , clientId = "555"
        , payload =
            [ Parameter.CacheBuster "289372387623"
            , Parameter.EventCategory "video"
            , Parameter.EventAction "play"
            , Parameter.EventLabel "holiday"
            , Parameter.EventValue 300
            ]
        }
        , { hitType = HitType.Pageview
          , trackingId = "UA-123456-1"
          , clientId = "5555"
          , payload = [ Parameter.DocumentPath "/pageA" ]
        }
      ]
      |> Http.post
-}
batch :
    List Hit
    ->
        { url : String
        , body : Http.Body
        , expect : Http.Expect Msg
        }
batch hits =
    let
        payloads =
            List.map payloadToQuery hits

        body =
            String.join "\n" payloads
    in
    { url = "https://www.google-analytics.com/batch"
    , body = Http.stringBody "" body
    , expect = Http.expectWhatever Measured
    }


{-| Sends hit to GA HTTP post request with pageview hit. A pageview is an
instance of a page being loaded (or reloaded) in a browser.

    pageview "UA-XXXXX-Y" "555" "/pageA"

-}
pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    post
        { hitType = HitType.Pageview
        , trackingId = trackingId
        , clientId = clientId
        , payload = [ Parameter.DocumentPath documentPath ]
        }
        |> Http.post


{-| Sends hit to GA HTTP post request with event hit. Events are user
interactions with content that can be measured independently from a web-page or
screen load. Downloads, link clicks, form submissions, and video plays are all
examples of actions you might want to analyze as Events.

    event "UA-XXXXX-Y" "555" "Category" "Action" "Label" 55

-}
event : String -> String -> String -> String -> String -> Int -> Cmd Msg
event trackingId clientId category action label value =
    post
        { hitType = HitType.Event
        , trackingId = trackingId
        , clientId = clientId
        , payload =
            [ Parameter.EventCategory category
            , Parameter.EventAction action
            , Parameter.EventLabel label
            , Parameter.EventValue value
            ]
        }
        |> Http.post
