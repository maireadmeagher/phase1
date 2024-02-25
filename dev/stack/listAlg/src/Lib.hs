module Lib
    ( someFunc
    ) where
import Data.List.Split(splitOn)
import qualified Data.List as L
import Data.ByteString (head)
-- import Data.ByteString (length)

someFunc :: IO ()
someFunc = do 
            -- x <- 
                -- print $ findSentences "qw,e\ne, io\nq, u"
                -- print (findFields  ["field1, field2", "field21 ,field22"])

                print $ findFields $  findSentences "qw,e\ne, io\nq, u"
                -- print $ splitAll "4, 5\n14,15\n24,25"
                print $ head $ L.transpose $ fromStringToNumbers $ splitAll "3,4,4\n14,3,1\n24,25,10"

findSentences :: String -> [String]
findSentences  =   splitOn  "\n" 

findFields :: [String] -> [[String]]
findFields  = map (splitOn $ "," )  --"field1, field2"

splitAll  :: String -> [[String]]
splitAll xs = map (splitOn $ "," ) $ splitOn "\n"  xs

sumLists :: [[Int]] -> [Int]
sumLists  = map sum 
fromStringToNumbers :: [[String]]-> [[Int]]
fromStringToNumbers xss = map ( map read ) xss

-- howManyPasses :: String -> Int
-- howManyPasses ns =  length $  filter(>=40)$ head ($ L.transpose $ fromStringToNumbers $ splitAll ns)
