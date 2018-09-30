import Network.Wai (responseLBS, Application, responseLBS, responseStream)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200, notFound404)
import Network.HTTP.Types.Header (hContentType)
import Network.Wai (rawPathInfo)
import Control.Concurrent (threadDelay)
import System.Clock (getTime, Clock(Realtime), TimeSpec(..))
import Control.Monad


main = do
    let port = 8000
    putStrLn $ "Listening on port " ++ show port
    run port app

app request respond  = case rawPathInfo request of
  "/"         -> respond $ hello
  "/work"     -> respond $ work
  "/sleep"    -> respond $ sleep
  "/transfer" -> respond $ transfer
  _           -> respond $ notFound

hello = responseLBS status200 [] "Hello, World!"

work = responseStream status200 [] $ \write flush -> do
 start <- getTime Realtime
 let loop = do
         let loop2 :: Int -> IO ()
             loop2 0 = return ()
             loop2 n = loop2 $ n-1
         loop2 250000
         current <- getTime Realtime
         when (current - start < TimeSpec{sec=0, nsec=7500000}) loop
 loop

sleep = responseStream status200 [] $ \write flush -> do
 start <- getTime Realtime
 let loop = do
         threadDelay 500
         current <- getTime Realtime
         when (current - start < TimeSpec{sec=0, nsec=7500000}) loop
 loop

transfer = responseLBS status200 [] ""

notFound = responseLBS notFound404 [] ""
