module Main (..) where

import Html
import Mouse


view : Int -> Html.Html
view x =
  Html.text (toString x)

countSignal : Signal Int
countSignal =
  Signal.foldp adds1 0 Mouse.clicks

adds1 : () -> Int -> Int
adds1 input previous =
  1 + previous

main : Signal.Signal Html.Html
main =
  countSignal
    |> Signal.map view

