module Main where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC
import Network.HTTP.Simple
import Network.HTTP.Types.Status (statusCode)
myToken :: BC.ByteString
myToken = "<API TOKEN HERE>"

noaaHost :: BC.ByteString
noaaHost = "www.ncdc.noaa.gov"

apiPath :: BC.ByteString
apiPath = "/cdo-web/api/v2/datasets"


-- response = httpLBS "http://news.ycombinator.com"


-- main :: IO()
-- main = do
--     response <- httpLBS    "http://httpbin.org/get"   --"http://www.ncdc.noaa.gov/cdo-web/api/v2/datasets"   --noaaHost  --

--     putStrLn $ "The status code was: " ++
--                show (getResponseStatusCode response)
--     print $ getResponseHeader "Content-Type" response
--     LC.putStrLn $ getResponseBody response



main :: IO ()
main = do
  manager <- newManager defaultManagerSettings

  request <- parseRequest "http://httpbin.org/get"
  response <- httpLbs request manager

  putStrLn $ "The status code was: " ++ (show $ statusCode $ responseStatus response)
  print $ responseBody response