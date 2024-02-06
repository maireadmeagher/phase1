g f p xs= map f (filter p xs) 

all' p = and . map p 
any' p = or . map p

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ []                  = []
takeWhile' p (x:xs) |  p x       = x : takeWhile' p xs
                    | otherwise  = []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ []                  = []
dropWhile' p (x:xs) |  p x       = dropWhile' p xs
                    | otherwise  = x:xs