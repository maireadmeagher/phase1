import Distribution.TestSuite (TestInstance(name))
import Distribution.Simple.Utils (xargs)
helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

main :: IO()   -- IO action
main = do
    putStrLn "Hello ! What's your name? "
    name <- getLine
    let statement = helloPerson name
    putStrLn statement

data  MyTree = Node  MyTree MyTree    | Leaf Int

t :: MyTree
t = Node (Leaf 1) (Node (Leaf 3) (Node (Leaf 5 ) (Leaf 4)))

sumr :: Num a => [a] -> a
sumr [] = 0
sumr (x:xs) = x + sum xs

sumf :: Num a => [a] -> a 
sumf xs = foldr (+) 0 xs

reverser :: [a] -> [a]
reverser [ ]    =  [ ]
reverser (x:xs) = reverser xs ++ [x]

reversef :: [a] -> [a]
reversef = foldr (\x xs ->  xs ++ [x] ) []

mapf :: (a -> b) -> [a] -> [b]
mapf f = foldr (\x xs -> f x : xs) []

mapr :: (a -> b) -> [a] -> [b]
mapr f [] = []
mapr f (x:xs) = f x : mapr f xs