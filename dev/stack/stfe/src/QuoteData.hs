
 module QuoteData where

import Data.Time (Day, parseTimeOrError,  defaultTimeLocale, diffDays)
import CleanData

data QuoteData = QuoteData {  -- using the order that the csv file uses
                   day :: Day,
                   open :: Double,
                   close :: Double
                 }
  deriving (Ord, Eq, Show)


data QField = Open | Close 
  deriving (Eq, Ord, Show, Enum, Bounded)

field2fun :: QField -> QuoteData -> Double
field2fun Open = open
field2fun Close = close
field2fun High = high
field2fun Low = low
field2fun Volume = fromIntegral . volume

makeDate :: String -> Day
makeDate  = parseTimeOrError True defaultTimeLocale "%Y-%m-%d"

--convert each of the strings to an appropriate type in form of tuple
strToTuple :: [String] -> (Day,  Double, Double)
strToTuple (day:open:high:_)  = 
              (makeDate day, read close:: Double,
              read open::Double)

tupleToQuote :: (Day, Double, Int, Double, Double, Double)  -> QuoteData
tupleToQuote (day, close, vol, open, high, low )  = QuoteData day vol open  close high low


makeAllQuotes::String -> [QuoteData]
makeAllQuotes csvData = map (tupleToQuote . strToTuple ) (getImportedData csvData)

