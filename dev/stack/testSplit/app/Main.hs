module Main (main) where

import Lib

main :: IO ()
main = putStrLn ( head (someFunc))

putTest :: [String] -> IO()
putTest [] = return ()
putTest (x:xs) = putStrLn x ++ putTest xs
