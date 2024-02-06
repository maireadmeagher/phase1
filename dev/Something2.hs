data List a = Nil | Cons a (List a) 
--myLen :: List a -> Int
myLen Nil = 0
myLen (Cons _ xs) = 1 + myLen xs
