module Main where

import StringUtils

main :: IO ()
main = do
    name <- getLine
    print $ srtToUpper name
    other <- getLine
    let response = if isAnagram name other
        then "they are anagrams of each other"
        else  "no they're not"
    print response
    print $ encode 3 name
