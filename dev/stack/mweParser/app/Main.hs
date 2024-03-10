{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as BL
import Data.Csv
import Data.Text (Text, toUpper)
import Data.Vector (Vector)

data Book = Book
    { title :: !Text
    , author :: !Text
    , genre :: !Text
    , pages :: !Int
    } deriving Show

instance FromNamedRecord Book where
    parseNamedRecord m = Book
        <$> (m .: "Title")
        <*> m .: "Author"
        <*> parseGenre (m .: "Genre")
        <*> m .: "Pages"

parseGenre ::  Parser Text ->  Parser Text
parseGenre parser = do
    genreText <- parser
    return $ toUpper genreText

main :: IO ()
main = do
    csvData <- BL.readFile "data/books.csv"
    case decodeByName csvData of
        Left err -> putStrLn $ "Error: " ++ err
        Right (_, v) -> print (v :: Vector Book)
