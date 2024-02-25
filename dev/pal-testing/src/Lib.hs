module Lib  
     (isPalindrome
     , preProcess
     )  where

import Data.Text as T         
import Data.Char(isPunctuation)


isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText  == T.reverse cleanText 
  where cleanText = preProcess text


preProcess :: T.Text -> T.Text 
preProcess text  = T.filter (not . isPunctuation) text