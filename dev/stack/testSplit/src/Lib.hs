module Lib
    ( someFunc
    ) where
import Data.List.Split (splitOn)

someFunc ::  [String]
someFunc  = splitOn "hello there" " "

