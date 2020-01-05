module Measurement exposing (Msg, hit, pageview, post)

import HitType exposing (HitType)
import Http
import Parameter
import Url.Builder as Url


type Msg
    = Measured (Result Http.Error ())


hit :
    HitType
    -> String
    -> String
    -> List ( Parameter.Parameter, String )
    -> String
hit type_ trackingId clientId values =
    let
        url =
            Url.absolute [ "collect" ]
                ([ Url.string (Parameter.toString Parameter.ProtocolVersion)
                    "1"
                 , Url.string (Parameter.toString Parameter.TrackingID)
                    trackingId
                 , Url.string (Parameter.toString Parameter.ClientID) clientId
                 , Url.string (Parameter.toString Parameter.Hittype) <|
                    HitType.toString type_
                 ]
                    ++ List.map
                        (\( key, value ) ->
                            Url.string
                                (Parameter.toString key)
                                value
                        )
                        values
                )
    in
    "https://www.google-analytics.com" ++ url


post : String -> Cmd Msg
post url =
    Http.post
        { url = url
        , body = Http.emptyBody
        , expect = Http.expectWhatever Measured
        }


pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    hit HitType.Pageview
        trackingId
        clientId
        [ ( Parameter.DocumentPath, documentPath ) ]
        |> post
