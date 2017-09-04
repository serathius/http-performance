import Network.HTTP.Types (status200)
import Network.Wai (Response, responseLBS)
import Network.Wai.Internal (ResponseReceived)
import Network.Wai.Handler.Warp (run)
import Network.Wai.Predicate (true)
import Network.Wai.Routing (Routes, route, continue, get, prepare, Continue)
import qualified Data.ByteString.Lazy as Lazy (ByteString)

main :: IO ()
main = run 8000 (route (prepare app))

app :: Routes a IO ()
app = do
    get "/" (respond200 "Hello World!") true

respond200 :: Lazy.ByteString -> a -> Continue IO -> IO ResponseReceived
respond200 text = continue . const $ writeTextResponse text

writeTextResponse :: Monad m => Lazy.ByteString -> m Response
writeTextResponse = return . responseLBS status200 []
