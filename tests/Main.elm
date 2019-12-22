module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Measurement as GA


type alias Model =
    { text : String }


init : () -> ( Model, Cmd msg )
init flags =
    ( { text = "Model" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


type Msg
    = SendEvent
    | Ga GA.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SendEvent ->
            ( model, Cmd.map Ga <| GA.pageview "UA-151596008-1" "555" "/home" )

        Ga m ->
            let
                _ =
                    Debug.log "message" m
            in
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick SendEvent ] [ text "Send Event" ]
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , view = view
        , update = update
        }
