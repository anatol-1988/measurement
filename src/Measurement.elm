module Measurement exposing (Msg, getHit, pageview, postHit)

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
    , payload : List ( Parameter.Parameter, String )
    }


getHit : Hit -> { expect : Http.Expect Msg, url : String }
getHit hit =
    let
        url =
            payloadToQuery hit
    in
    { expect = Http.expectWhatever Measured
    , url = "https://www.google-analytics.com/collect?" ++ url
    }


postHit : Hit -> { url : String, body : Http.Body, expect : Http.Expect Msg }
postHit hit =
    { url = "https://www.google-analytics.com/collect"
    , body = Http.stringBody "" <| payloadToQuery hit
    , expect = Http.expectWhatever Measured
    }


payloadToQuery : Hit -> String
payloadToQuery hit =
    let
        payload =
            [ Url.string (Parameter.toString Parameter.ProtocolVersion)
                "1"
            , Url.string (Parameter.toString Parameter.TrackingID)
                hit.trackingId
            , Url.string (Parameter.toString Parameter.ClientID) hit.clientId
            , Url.string (Parameter.toString Parameter.Hittype) <|
                HitType.toString hit.hitType
            ]
                ++ List.map
                    (\( key, value ) ->
                        Url.string
                            (Parameter.toString key)
                            value
                    )
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
    postHit
        { hitType = HitType.Pageview
          , trackingId = trackingId
          , clientId = clientId
          , payload = [ ( Parameter.DocumentPath, documentPath ) ]
          }
        |> Http.post
