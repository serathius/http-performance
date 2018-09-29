module Main where

import Yesod

data YesodDemo = YesodDemo

mkYesod "YesodDemo" [parseRoutes|
/ Hello GET
|]

instance Yesod YesodDemo

getHello :: Handler String
getHello = return "Hello, world!"


main :: IO ()
main = do
  warp 8000 $ YesodDemo