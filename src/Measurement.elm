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
            Url.absolute [ "collect" ]
                ([ Url.string (Parameter.toString Parameter.ProtocolVersion)
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
                )
    in
    { expect = Http.expectWhatever Measured
    , url = "https://www.google-analytics.com" ++ url
    }


postHit : Hit -> { url : String, body : Http.Body, expect : Http.Expect Msg }
postHit hit =
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
    { url = "https://www.google-analytics.com/collect"
    , body = Http.stringBody "" <| String.dropLeft 1 <| Url.toQuery payload
    , expect = Http.expectWhatever Measured
    }


batch : List Hit -> ( String, Http.Body )
batch hits =
    ( "", Http.emptyBody )


pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    postHit
        { hitType = HitType.Pageview
        , trackingId = trackingId
        , clientId = clientId
        , payload = [ ( Parameter.DocumentPath, documentPath ) ]
        }
        |> Http.post
