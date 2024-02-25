module Main (main) where
import qualified Data.Text as T

import Lib (makeTitle)

main :: IO ()
main = do 
    txt <- getLine
    print $ makeTitle $ T.pack txt
