module Main (main) where

import System.Random

minDie :: Int 
minDie = 1

maxDie :: IntmaxDie  = 6

main :: IO()
main = do
    dieRoll <- randomRIO (minDie, maxDie)
    putStrLn ( show dieRoll)