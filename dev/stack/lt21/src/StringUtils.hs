module StringUtils where

import Data.Char
import Data.List
--needs Data.Char for sort
srtToUpper :: String -> String 
srtToUpper  = map  toUpper 

-- sort needs Data.List
isAnagram :: String -> String -> Bool
isAnagram  xs ys = sort xs == sort ys

-- needs Data.Char
encode ::  Int -> String-> String
encode shf xs = 
    let chrs = map ord xs
        codeShft = map (+shf) chrs
        encoded = map chr codeShft
    in encoded
