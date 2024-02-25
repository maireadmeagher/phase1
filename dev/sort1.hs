import Data.List ( sort, sortBy )

names :: [(String, String)]
names = [("Angela", "Merkel"), ("Joe", "Biden"), ("Michael D", "Higgins"), ("Boris", "Johnson")]

compareLastNames :: Ord a => (a, a) -> (a, a) -> Ordering
compareLastNames name1 name2 
           | lastName1 > lastName2 = GT 
           | lastName1 < lastName2 = LT
           | otherwise = EQ
    where   lastName1 = snd name1
            lastName2 = snd name2
 
