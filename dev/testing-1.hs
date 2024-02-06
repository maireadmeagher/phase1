f :: Int -> Int -> String
f x y = "The sum of " ++ show x ++ " and " ++ show y ++ " is " ++ show (x+y) ++ "."

main =
    do putStrLn "What is your name? "
       name <- getLine
       putStrLn ("Hello " ++ name)

half :: Int -> Maybe Int
half x = if even x 
            then Just (x `div` 2)
            else Nothing