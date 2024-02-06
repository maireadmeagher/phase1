module Main (main) where


import Csv (safeMkCsv)
import qualified Data.Text as T
import qualified  Data.ByteString.Char8  as B

main :: IO ()
main = print $ "hello" --safeMkCsv (Just [T.pack "First", T.pack "Secon"]) [[1,2], [3,4]] 
