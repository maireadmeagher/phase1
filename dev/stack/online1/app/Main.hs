{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}


module Main where

import Online
import Control.Monad (when, unless)
import qualified Data.ByteString.Lazy as BL (readFile, writeFile)
import Data.Csv
import Data.Foldable (toList)
-- main::  IO ()
-- main  = do
--   readStudents 
-- main ::IO ()
-- main  = do
--   csvData <- BL.readFile "quotes.csv"
--   case decodeByName csvData of
--     Left err -> putStrLn "errorerror err"
--     Right (_, students) -> putStrLn "no error"

                            -- print $ head lst where
                            --     lst = pure (toList students)
main ::  IO ()
main  = do
  csvData <- BL.readFile ("quotes.csv")
  case decodeByName QuoteData of
    Left err -> putStrLn err
    Right (_, quotes) -> putStrLn "no error"

