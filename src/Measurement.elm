module Measurement exposing (HitType(..), Msg, hit, pageview, post)

import Http
import Parameter
import Url.Builder as Url


type Msg
    = Measured (Result Http.Error ())


type HitType
    = Pageview
    | Screenview
    | Event
    | Transaction
    | Item
    | Social
    | Exception
    | Timing


toString : HitType -> String
toString hitType =
    case hitType of
        Pageview ->
            "pageview"

        Screenview ->
            "screenview"

        Event ->
            "event"

        Transaction ->
            "transaction"

        Item ->
            "item"

        Social ->
            "social"

        Exception ->
            "exception"

        Timing ->
            "timing"


hit : HitType -> String -> String -> List ( String, String ) -> ( String, Http.Body )
hit type_ trackingId clientId values =
    let
        url =
            Url.absolute [ "collect" ]
                ([ Url.string "v" "1"
                 , Url.string "tid" trackingId
                 , Url.string "cid" clientId
                 , Url.string "t" <| toString type_
                 ]
                    ++ List.map (\( key, value ) -> Url.string key value) values
                )
    in
    ( "https://www.google-analytics.com" ++ url, Http.emptyBody )


post : ( String, Http.Body ) -> Cmd Msg
post ( url, body ) =
    Http.post
        { url = url
        , body = body
        , expect = Http.expectWhatever Measured
        }


pageview : String -> String -> String -> Cmd Msg
pageview trackingId clientId documentPath =
    hit Pageview trackingId clientId [ ( "dp", documentPath ) ] |> post
