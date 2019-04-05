import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Element exposing (Element, centerX, centerY, column, el, fill, height, image, layout, none, pointer, px, row, text, width)
import List exposing (repeat)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = Int

init : Model
init =
  0


-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view : Model -> Html Msg
view model =
  layout [ width fill, height fill ] <|
    el [ centerX, centerY ] <| 
      row [] (viewFarm 2 2)

--viewFarm : Element msg
--viewFarm =
    --row [ ]
        --[ viewFarmRow
        --, viewFarmRow
        --]

viewFarmRow : Int -> List (Element msg)
viewFarmRow columns =
  repeat columns (viewPlot "Plot x")

viewPlot : String -> Element msg
viewPlot name =
  el [ ] (text name)

viewFarm : Int -> Int -> List ( List (Element Msg) )
viewFarm rows columns =
  repeat rows (viewFarmRow columns)
