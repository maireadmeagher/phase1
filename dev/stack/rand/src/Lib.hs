module Lib
    ( userRand
    ) where

import System.Random

userRand = randomIO :: IO Int

