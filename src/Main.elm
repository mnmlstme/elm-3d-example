port module Main exposing (..)

import Browser exposing (Document)
import Html exposing (Html, article, text)
import Scene exposing (scene)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


port input : (String -> msg) -> Sub msg



-- MODEL


type alias Model =
    { html : String }


init : flags -> ( Model, Cmd msg )
init flags =
    ( { html = "" }, Cmd.none )



-- UPDATE


type Msg
    = Incoming String


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Incoming x ->
            ( { model | html = x }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    input Incoming



-- VIEW


view : Model -> Html msg
view model =
    article []
        [ text model.html
        , scene
        ]
