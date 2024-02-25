module Main where

import Lib

main :: IO ()
main = do
    print "_______________________________"
    print "Generating Three Random Numbers"

    randomOne <- userRand
    print randomOne
    
    randomTwo <- userRand
    print randomOne

    randomThree <- userRand
    print randomThree
