module Palindrome(isPalindrome) where

import Data.List (sort)
import Data.Char ( isSpace, isPunctuation )
import Data.Text as T ( Text, filter, pack, reverse, toLower )


isPalindrome :: String -> Bool
isPalindrome text = cleanText == T.reverse cleanText where 
    cleanText = preprocess (pack text) 

stripWhiteSpace :: Text -> Text
stripWhiteSpace = T.filter (not. isSpace)

stripPunctuation :: Text -> Text
stripPunctuation = T.filter (not. isPunctuation)

preprocess :: Text -> Text
preprocess = stripWhiteSpace . stripPunctuation . T.toLower