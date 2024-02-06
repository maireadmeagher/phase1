-- findingsuccess examples
module Ffs (countChars, isAnagram, main)
where

import Data.List   --- includes sort
import qualified Data.Text as T  -- pack, unpack
import Text.Read
-- import Data.List.Split (splitOn)

isAnagram :: String -> String -> Bool
isAnagram word1 word2 = (sort word1) == (sort word2)


countChars :: String -> Int
-- ^ testing haddock
countChars xs = ( T.length . T.pack ) xs



-- stringToInt :: [String] -> [Int]
-- stringToInt = map (\x -> read x :: Int)


-- -- Get a List of Students
-- getStudentNames :: String -> [String]
-- getStudentNames csvData = map (head . tail . splitOn ",") $ tail $ splitOn "\r\n" csvData

-- -- Get Student Marks
-- getMarksOnly :: String -> [[Int]]
-- getMarksOnly csvData = map (stringToInt . drop 3 . splitOn ",") $ tail $ splitOn "\r\n" csvData

-- -- Get the Marks again, but weighted
-- getAverageMarksAndWeight :: String -> [Int]
-- getAverageMarksAndWeight csvData = map (\x -> (sum x + x!!4) `div` length x) $ getMarksOnly csvData

-- -- Get a list of Students with Marks Weighted
-- getStudentsAndAverageWeightedMarks :: String -> [(String, Int)]
-- getStudentsAndAverageWeightedMarks csvData = zip (getStudentNames csvData) (getAverageMarksAndWeight csvData)

-- -- Get Student IDs
-- getStudentsIds :: String -> [String]
-- getStudentsIds csvData = map (head . tail . tail . splitOn ",") $ tail $ splitOn "\r\n" csvData

-- -- Get a list of Students and their Student IDs
-- getStudentsAndIds :: String -> [(String, String)]
-- getStudentsAndIds csvData = zip (getStudentNames csvData) (getStudentsIds csvData)

-- -- Get a List of Modules (4.b)
-- getModules :: String -> [String]
-- getModules csvData = drop 3 . splitOn "," $ head $ splitOn "\r\n" csvData


-- | this is the main program
main :: IO ()
main =    do 
print " ________________________ "
--     csvData <- readFile "data.csv"
--     print "Imported CSV Data :)"
--     -- print csvData

--     print " * - * - * - #4.a "
--     -- print $ getStudentNames csvData
--     -- print " * - * - * "
--     -- print $ getMarksOnly csvData
--     -- print " * - * - * "
--     -- print $ getAverageMarksAndWeight csvData
--     -- print " * - * - * "
--     print $ getStudentsAndAverageWeightedMarks csvData

--     print " * - * - * #4.b"
--     print $ getModules csvData

--     print " * - * - * #4.c {using ID instead of address as per Mairead}"
--     -- print $ getStudentsIds csvData
--     print $ getStudentsAndIds csvData