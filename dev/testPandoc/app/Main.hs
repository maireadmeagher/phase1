{-#LANGUAGE OverloadedStrings #-}

-- import qualified Data.Text.IO as TIO

-- main :: IO ()
-- main = do
--     -- Your Text content
--     let markdownContent = "This is some Markdown content.\n\nIt can contain *emphasis*, **strong emphasis**, and [links](https://example.com)."

--     -- Write the Text content to a Markdown file
--     TIO.writeFile "output.md" markdownContent

--     putStrLn "Markdown file written successfully."


import qualified Data.Text as T
import qualified Data.Text.IO as TIO(writeFile)
import Data.Text.Encoding (decodeUtf8)
import Text.Pandoc
import Data.ByteString.Lazy (toStrict)

main :: IO ()
main = do
     let textContent = T.pack "This is some text content."
     let pandocDocument = Pandoc nullMeta [Plain [Str textContent]]
     TIO.writeFile "output.docx" $ decodeUtf8 (toStrict $ writeDocx def pandocDocument)




-- -- ...

-- TIO.writeFile "output.docx" $ decodeUtf8 (toStrict $ writeDocx def pandocDocument)