--topic02.hs
--Exercise sheet

{- let    a = 10
       xs =  [1,2,3,4,5]  in N = a `div` length xs  -}

aaa = let y = 1+2
          z = 4+6
          in  y+z

n =  let  a = 10
          xs =  [1,2,3,4,5]
          in    a `div` length xs 


n2 =  let  a = 10     -- lowercase
           xs2 =  [1,2,3,4,5]   -- indentation
           in    a `div` length xs2 -- incorrect quotes

last :: [a] -> a
last xs = head (reverse xs)

myinit :: [a] -> [a]
myinit xs = reverse(tail (reverse (xs)))