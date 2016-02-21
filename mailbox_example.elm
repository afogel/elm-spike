module Main (..) where

import Html
import Html.Events as Events
import String

incrementBy1 : Int -> Int
incrementBy1 input =
  input + 1

view : Signal.Address Int -> Int -> Html.Html
view address message =
  Html.div
    []
    [
      Html.div [] [ Html.text (toString message) ]
    , Html.button
        [ Events.onClick address (incrementBy1 message) ]
        [ Html.text "Click" ]
    ]

mb : Signal.Mailbox Int
mb =
  Signal.mailbox 0

main : Signal Html.Html
main =
  Signal.map (view mb.address) mb.signal