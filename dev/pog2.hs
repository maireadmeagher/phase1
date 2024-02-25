module ProgrammingOutLoud  where
import Test.HUnit -- imports TestCase,assertEqual,TestList,runTestTT and others
import Data.Char(ord)

{-
"345" ( ['3','4','5'] )
[3,4,5]
[(5,1),(4,10),(3,100)]
[5,40,300]
345

-}

stringToInt x1 = (f4 . map f3 . f2 . map f1) x1
  where f1 x = ord x - ord '0'
        f2 x = zip (reverse x) [ 10 ^ i | i <- [0 ..]]
        f3 x = fst x * snd x
        f4 x = sum x
        
strToInt = (sum . map (uncurry (*)) . f2 . map f1)
  where f1 x = ord x - ord '0'
        f2 x = zip (reverse x) [ 10 ^ i | i <- [0 ..]]
                             -- (map (10 ^) [0..])
        
           