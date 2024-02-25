module Main where

import Lib (clean, getHeaderRow, getDataWithoutHeader, getDataWithoutNames, changeToNum, getStudAverages)
import System.Environment
import Formatting.Formatters


main :: IO ()
main = do
     (file:_) <- getArgs    -- getArgs returns a List of Strings so we are binding 
                            -- the first  String to file using pattern matching
                            -- if you wosh to use getArgs outside of stack, you need to use 
                            --  :set args "data.csv" then 
                            -- run main
     csvData <- readFile file --  csvData :: String so to us this you need to preprocess this 

    -- print  $ dataWithAverages 

    --  print $ "_______HEADER_________"

    --  print $ getHeaderRow csvData

     print $ "________DATA________"

    --  print $ getDataWithoutHeader csvData
    --  print $ "________DATA WITHOUT NAMES________"

    --  print $ getDataWithoutNames $ getDataWithoutHeader csvData

    --  print  "________INTEGER DATA WITHOUT NAMES________"
    --  print $ changeToNum $ getDataWithoutNames $ getDataWithoutHeader csvData

    --  print   " --------AVERAGES  -----------------------"
    --  print $  getStudAverages $ changeToNum $ getDataWithoutNames $ getDataWithoutHeader csvData

printDataWithAverages :: [[String]]-> [String] -> String
printDataWithAverages marks average = zipWith (++)  marks average
     
-- todo ++ "\n" tp the end of each line. 