module Main where

import Lib

main :: IO ()
main = do 
    word <- getLine
    let n =  someFunc word
    print n

