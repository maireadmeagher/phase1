{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

-- StatisticsProfileDate	CovidCasesConfirmed	HospitalisedCovidCases	RequiringICUCovidCases	HealthcareWorkersCovidCases	ClustersNotified	HospitalisedAged5
import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics

data CovidData = CovidData
            { day :: Day
            , cases :: Int
            , hospitalised :: Int
            } deriving Show
instance FromJSON CovidData where
parseJSON (Object v) =
    CovidData <$> v .: "StatisticsProfileDate"
                 <*> v .: "CovidCasesConfirmed"
                 <*> v .: "HospitalisedCovidCases"

instance ToJSON Book

myBook :: Book
myBook = Book {author="Will Kurt"
              ,title="Learn Haskell"
              ,year=2017}

myBookJSON :: BC.ByteString
myBookJSON = encode myBook

rawJSON :: BC.ByteString
rawJSON = "{\"author\":\"Emil Ciroan\",\"title\":\"A Short History of Decay\",\"year\":1949}"

bookFromJSON :: Maybe Book
bookFromJSON = decode rawJSON

wrongJSON :: BC.ByteString
wrongJSON = "{\"writer\":\"Emil Cioran\",\"title\":\"A Short History of Decay\",\"year\"=1949}"

bookFromWrongJSON :: Maybe Book
bookFromWrongJSON = decode wrongJSON


eitherBookFromWrongJson :: Either String Book
eitherBookFromWrongJson = eitherDecode wrongJSON

sampleError :: BC.ByteString
sampleError = "{\"message\":\"oops!\",\"error\": 123}"

sampleErrorMessage :: Maybe ErrorMessage
sampleErrorMessage = decode sampleError
sampleDecode :: BC.ByteString
sampleDecode = encode sampleErrorMessage

data ErrorMessage = ErrorMessage
                    { message :: T.Text
                    , errorCode :: Int
                    } deriving Show


instance FromJSON ErrorMessage where
  parseJSON (Object v) =
    ErrorMessage <$> v .: "message"
                 <*> v .: "error"

instance ToJSON ErrorMessage where
  toJSON e = object [
    "message" .= message e,
    "error"  .= errorCode  e ]

main :: IO ()
main = do 
          (file:_) <- getArgs
          quotes <- readFile file
          
