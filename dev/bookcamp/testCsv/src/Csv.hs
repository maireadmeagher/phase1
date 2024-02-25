module Csv ( safeMkCsv
 ) where

import qualified Data.Text as T
-- import qualified Control.Monad as M
import qualified Data.List as L
import qualified Data.Maybe as M

type Column a = [a]

data Csv a = Csv
  { header :: Maybe [T.Text],
    columns :: [Column a]
  }
  deriving (Show)


safeMkCsv :: Maybe [T.Text] -> [Column a] -> Either String (Csv a)
safeMkCsv mHeader columns
  | not headerSizeCorrect =
      Left "Size of header row does not fit number of columns"
  | not columnSizesCorrect =
      Left "The columns do not have equal sizes"
  | otherwise = Right Csv {header=mHeader, columns=columns}
  where
    headerSizeCorrect =
      M.maybe True (\h -> L.length h == L.length columns) mHeader
    columnSizesCorrect =
      L.length (L.nubBy (\x y -> length x == length y) columns) <= 1