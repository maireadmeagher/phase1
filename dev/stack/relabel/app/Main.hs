module Main where

import Tree
import Control.Monad.State.Lazy

main :: IO ()
main = do 
    print $ fst $ app(mlabel tree) 0
    print $ fst $ runState  $ mlabel tree 0


