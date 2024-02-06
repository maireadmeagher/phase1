{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}


module Online where

import Data.Time (Day, parseTimeM, defaultTimeLocale)
import Data.ByteString.Char8 (unpack)
import Data.ByteString.Lazy (ByteString)
import GHC.Generics (Generic)
-- import Data.Csv   ( DefaultOrdered(headerOrder)

--   , FromField(parseField)
--   , FromNamedRecord(parseNamedRecord)
--   , Header
--   , ToField(toField)
--   , ToNamedRecord(toNamedRecord)
--   , (.:)
--   , (.=)
--   , Parser
--   , runParser, 
--   ),  hiding(sortOn)
import Data.Csv 
newtype  DefaultToZero = DTZ Double deriving (Show, Eq, Ord)

data QuoteData = QuoteData {
                   day :: Day,
                   volume :: Int,
                   open :: Double,
                   close :: Double,
                   high :: Double,
                   low :: Double
                 }
  deriving (Generic, Show, Ord, Eq)

instance FromNamedRecord QuoteData where
    parseNamedRecord m = QuoteData <$> m .: "day" 
                                   <*> m .:  "volume"
                                   <*> m .: "open"
                                   <*> m .: "close"
                                   <*> m .: "high"
                                   <*> m .: "low"



instance FromField Day where
  parseField = parseTimeM True defaultTimeLocale "%Y-%m-%d" . unpack

instance FromField DefaultToZero where
  parseField  s = case runParser (parseField s ) of 
                Left err -> pure $ DTZ (-1)
                Right n ->  pure $ DTZ n


toDouble  :: DefaultToZero -> Double
toDouble (DTZ d) = d

data QField = Open | Close | High | Low | Volume
  deriving (Eq, Ord, Show, Enum, Bounded)

field2fun :: QField -> QuoteData -> Double
field2fun Open =   open
field2fun Close = close
field2fun High = high
field2fun Low = low
field2fun Volume = fromIntegral . volume
