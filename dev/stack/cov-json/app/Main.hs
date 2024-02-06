{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Main where

-- StatisticsProfileDate	CovidCasesConfirmed	HospitalisedCovidCases	RequiringICUCovidCases	HealthcareWorkersCovidCases	ClustersNotified	HospitalisedAged5
import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics
import System.Environment(getArgs)
import Data.Time

data CovidData = CovidData
            { day :: Day
            , cases :: Int
            , hospitalised :: Int
            } deriving (Show, Generic)

---problems with date parsing
-- instance FromField Day where
--   parseField = parseTimeM True defaultTimeLocale "%d/%m/%Y" . unpack
instance FromJSON CovidData where
  parseJSON = withObject "person" $ \o -> do
    textDate <- o .: "Date"
    cases  <- o .: "CovidCasesConfirmed"
    hospitalised  <- o .: "HospitalisedCovidCases"
    let day = makeDate textDate
    return CovidData{..}

-- instance FromJSON CovidData where
--   parseJSON = withObject "CovidData" $ \v -> CovidData  -- watch indentation here!!!
--              <$> v .: "Date"
--              <*> v .: "CovidCasesConfirmed"
--              <*> v .: "HospitalisedCovidCases"
instance ToJSON CovidData where
  toJSON (CovidData day cases hospitalised) = object ["Date" .= day, "CovidCasesConfirmed" .= cases, "HospitalisedCovidCases".= hospitalised]
jsonFile :: FilePath
jsonFile = "covidstats.json"
getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile
-- makeDate :: String -> UTCTime
-- makeDate tDate = parseTimeM True defaultTimeLocale "%d/%m/%Y" tDate

timeFormat = "%H:%M:%S"
understandTime = parseTimeOrError True defaultTimeLocale timeFormat

time :: UTCTime
time = understandTime "10:30:20"

makeDate :: T.Text -> Day
makeDate strDate = parseTimeOrError True defaultTimeLocale "%Y/%m/%d" (T.unpack strDate)

main :: IO ()
main = do
       d <- (eitherDecode <$> getJSON) :: IO (Either String [CovidData])

--  -- Get JSON data and decode it
--        d <- (eitherDecode <$> getJSON) :: IO (Either String [CovidData])
--  -- If d is Left, the JSON was malformed.
--  -- In that case, we report the error.
--  -- Otherwise, we perform the operation of
--  -- our choice. In this case, just print it.
       case d of
         Left err -> Prelude.putStrLn err
         Right ps -> Prelude.print ps

