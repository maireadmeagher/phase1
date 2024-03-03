module Main (main) where

import Palindrome (isPalindrome)

main :: IO ()
main = do 
       str <- getLine
       if isPalindrome str then putStrLn "Yes!"
       else putStrLn "No!"
