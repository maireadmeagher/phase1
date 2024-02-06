module Main where

import Lib
import System.Environment


main :: IO ()
main = do
     (file:_) <- getArgs      -- getArgs returns a List of Strings so we are binding the first String to file using pattern matching
                              -- if you wosh to use getArgs outside of stack, you need to use 
                              --  :set args "data.csv" then run main
     csvData <- readFile file --  csvData :: String so to us this you need to preprocess this 

     print $ csvData

