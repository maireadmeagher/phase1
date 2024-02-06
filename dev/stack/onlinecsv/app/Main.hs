{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import qualified Data.ByteString.Lazy as BL
import Data.Csv(FromNamedRecord, FromField, parseField, parseNamedRecord, runParser, decodeByName, (.:))
import qualified Data.Vector as V(forM_)
import GHC.Generics (Generic)

newtype DefaultInt = DefI Int

data Student = Student
    {
    studentId :: String
    , name   :: String
    , age :: Int
    , avg :: Double
    }

instance FromNamedRecord Student where
    parseNamedRecord r = Student <$> r .: "name" <*> r .: "salary"

-- instance FromField DefaultInt where
--   parseField  s = case runParser (parseField s ) of
--                 Left err -> pure $ DefI 0
--                 Right n ->  pure $ DefI n


-- toInt :: DefaultInt -> Int
-- toInt (DefI x) = x 

main :: IO ()
main = do
    csvData <- BL.readFile "students.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p ->  -- this loops through the [Person] so that we can print out each record.
            putStrLn $ studentId p++ " Name:  " ++  name p ++ "  Age:  " ++ show age p ++ show avg p 