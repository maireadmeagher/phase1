doubleMe x = x + x
testMe 3 = 4

--f ::Int -> Int -> [(Int,Int)]
f =  [(x,y) | y <- [1..3], x <- [y..3]] 

m = map (\x-> (if x>10 then 100 else x -5) ) [1, 10, 15]

mymap :: (a-> b) -> [a] -> [b]
mymap f []  = []
mymap f (x:xs) = f x : mymap f xs

myproduct1 :: [Int]-> Int
myproduct1 []        = 1
myproduct1  (x:xs)  = x * myproduct1 xs

myproduct2 :: [Int] -> Int
myproduct2 = foldr (*) 1

mylength ::[a]-> Int
mylength   = foldr (\_ xs -> 1 + xs)  0
