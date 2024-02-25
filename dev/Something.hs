double x = x+x
quadruple x = double (double x)
-- some comment
factorial n = product [1..n]
{- some long comment-}
average ns = sum ns `div` length ns

f:: Num a => a-> a
f a = a+1

twice :: Num a => (a-> a) -> a-> a  
twice f x = f (f x)