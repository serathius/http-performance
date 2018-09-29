module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Http.Server
import qualified Data.ByteString as BS

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "Hello, world!")
