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

-- main :: IO ()
-- main = do
     -- let textContent = T.pack "This is some text content."
     -- let pandocDocument = Pandoc nullMeta [Plain [Str textContent]]
     -- TIO.writeFile "output.docx" $ decodeUtf8 (toStrict $ writeDocx def pandocDocument)


import System.Process

main :: IO ()
main = do
    let inputFile = "data/module.docx"
        outputFile = "module.md"
    -- Convert .docx to HTML using Pandoc
    _ <- system $ "pandoc -s " ++ inputFile ++ " -o temp.html"
    -- Convert HTML to Markdown using Pandoc
    _ <- system $ "pandoc -s temp.html -o " ++ outputFile
    -- Clean up temporary HTML file
--     _ <- system "rm temp.html"
    putStrLn "Conversion complete."

-- -- ...

-- TIO.writeFile "output.docx" $ decodeUtf8 (toStrict $ writeDocx def pandocDocument)