module Measurement exposing (Msg, get, getHit, pageview)

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


getHit : Hit -> String
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
    "https://www.google-analytics.com" ++ url


batch : List Hit -> ( String, Http.Body )
batch hits =
    ( "", Http.emptyBody )


get : String -> Cmd Msg
get url =
    Http.get
        { expect = Http.expectWhatever Measured
        , url = url
        }


pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    getHit
        { hitType = HitType.Pageview
        , trackingId = trackingId
        , clientId = clientId
        , payload = [ ( Parameter.DocumentPath, documentPath ) ]
        }
        |> get
