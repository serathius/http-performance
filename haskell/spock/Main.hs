module Main where

import Web.Spock
import Web.Spock.Config

import Data.Monoid
import Data.IORef

data MySession = EmptySession
data MyAppState = DummyAppState (IORef Int)

main :: IO ()
main =
    do ref <- newIORef 0
       spockCfg <- defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
       runSpock 8000 (spock spockCfg app)

app :: SpockM () MySession MyAppState ()
app = do
  get root $ text "Hello, World!"
