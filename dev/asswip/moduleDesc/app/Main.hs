module Main (main) where
import System.Environment
import qualified Data.Text as T
import Lib
import ModuleData

main :: IO ()
main = do
     (file:_) <- getArgs    -- getArgs returns a List of Strings so we are binding 
                            -- the first  String to file using pattern matching
                            -- if you wosh to use getArgs outside of stack, you need to use 
                            --  :set args "data.csv" then 
                            -- run main
     csvData <- readFile file --  csvData :: String so to use this you need to preprocess this 

    -- print  $ dataWithAverages 

     print $ "_______HEADER_________"

     print $ getHeaderData csvData

     print $ "________DATA________"


     -- print $ head $ clean  $ getModuleData csvData

     print $ "_________MODULES_________"
     print $  getModuleData csvData
     -- print $ take 20$ tail  $ clean csvData --(splitOn' "\n" csvData)
     -- print $ getModuleName (getHeaderRow $ T.pack csvData)

     print $ "_________INDICATIVE MODULE CONTENT _________"
     print $ getModuleIndContent $  getModuleData csvData

getModuleData :: String -> [String]
getModuleData  ms =  clean $  dropWhile (/= '\n') ms

getHeaderData :: String -> String
getHeaderData = takeWhile (/= '\n')

myPrint :: [String] -> IO ()

myPrint [] = return ()
myPrint (x:xs) =  putStrLn x >> myPrint xs 