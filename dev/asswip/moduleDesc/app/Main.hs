module Main (main) where
import System.Environment
import qualified Data.Text as T
import Lib
import ModuleData
import Text.Pandoc
import Text.Pandoc.Builder(plain, text)
import Text.Pandoc.Writers.Docx (writeDocx)
import qualified Data.ByteString.Lazy as BL (writeFile)
import Data.Text (pack)
import qualified Data.Foldable as FL (toList) 

main :: IO ()
main = do
     (file:_) <- getArgs    -- getArgs returns a List of Strings so we are binding 
                            -- the first  String to file using pattern matching
                            -- if you wosh to use getArgs outside of stack, you need to use 
                            --  :set args "data.csv" then 
                            -- run main
     moduleData <- readFile file --  csvData :: String so to use this you need to preprocess this 


     print $   getModuleData moduleData
     let doc = plain (text (pack ((getHeaderData moduleData) ++ flatten' (getModuleData moduleData))) )-- Create a Pandoc document
     docx <- runIO $ writeDocx def (Pandoc nullMeta (FL.toList doc)) -- Convert the document to Docx format
     case docx of
        Left e -> error (show e) -- If there's an error, throw it
        Right bs -> BL.writeFile "output.docx" bs -- Otherwise, write the ByteString to a file


--      -- print $ "_________INDICATIVE MODULE CONTENT _________"
--      -- print $ getModuleIndContent $  getModuleData csvData

getModuleData :: String -> [String]
getModuleData  ms =  clean $  dropWhile (/= '\n') ms



getHeaderData :: String -> String
getHeaderData = takeWhile (/= '\n')

-- myPrint :: [String] -> IO ()

-- myPrint [] = return ()
-- myPrint (x:xs) =  putStrLn x >> myPrint xs 

flatten' :: [String] -> String
flatten' [] = []
flatten' (x:xs) = x ++ flatten' xs



