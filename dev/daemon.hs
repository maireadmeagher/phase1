
import Data.Maybe
data Expr = Val Int | Div Expr Expr | Mul Expr Expr 




safediv :: Int -> Int -> Maybe Int
safediv n m = if m==0 then
                              Nothing
                         else Just (n `div` m)

safeMul :: Int -> Int -> Maybe Int
safeMul n m = if m == 0 then
                  Just 0
              else Just (n * m)

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = case eval x of
                             Nothing -> Nothing
                             Just n -> case eval y of
                                    Nothing -> Nothing
                                    Just m -> safediv n m
    


eval (Mul a b) = case eval a of
                  Nothing -> Nothing
                  Just n -> case eval b of
                       Nothing -> Nothing
                       Just m -> safeMul n m

safediv' :: Int -> Int -> Either String Int
safediv' n m = if m==0 then    Left  "error message with details"
                       else  Right (n `div` m)

safetail'' :: Eq a => [a]  -> Either String  [a]
safetail'' xs = if null xs then
                             Left  "Cannot apply tail to empty list"
                         else Right (tail xs)

safetail' :: Int -> Int -> Maybe   Int
safetail' n m = if m==0 then   Nothing
                         else Just (n `div` m)