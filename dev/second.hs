

{- double ::Num a => a-> a
double x = x+x
apply  :: (a->b) ->  a -> b
apply double x  = double x -}

bools :: [Bool]
bools = [True, False]


nums :: [[Int]]
nums = [ [1,2,3], [2,3,4]]

add :: Int -> Int -> Int-> Int
add x y z= x + y + z

copy :: a -> (a,a)
copy x = (x, x)
second :: [a] -> a
second xs = head (tail xs)
swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)
pair :: a -> b-> (a,b)
pair x y = (x,y)
double ::Num a => a -> a
double x = x +x
pallindrome :: Eq a =>  [a] -> Bool
pallindrome xs = reverse xs == xs
twice :: (a->a) -> a -> a
twice f x = f (f x)

