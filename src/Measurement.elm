module Measurement exposing (Msg, event, get, pageview, post)

import HitType exposing (HitType)
import Http
import Parameter
import Url.Builder as Url


type Msg
    = Measured (Result Http.Error ())


type alias Hit =
    { hitType : HitType
    , trackingId : String
    , clientId : String
    , payload : List Parameter.Parameter
    }


get : Hit -> { expect : Http.Expect Msg, url : String }
get hit =
    let
        url =
            payloadToQuery hit
    in
    { expect = Http.expectWhatever Measured
    , url = "https://www.google-analytics.com/collect?" ++ url
    }


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


pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    post
        { hitType = HitType.Pageview
        , trackingId = trackingId
        , clientId = clientId
        , payload = [ Parameter.DocumentPath documentPath ]
        }
        |> Http.post


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
