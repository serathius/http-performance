module Main where

import Control.Monad
import Happstack.Server

main :: IO ()
main = simpleHTTP nullConf $ msum
    [ dir "" $ ok "Hello, World!"
    ]
