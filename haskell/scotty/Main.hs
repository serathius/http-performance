module Main where

import Web.Scotty

main = scotty 8000 $ do
  get  "/"      $ html "Hello, World!"
