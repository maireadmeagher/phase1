module ComparingSortingGrouping  where
-- Solutions for sorting
import Data.List(sort,sortBy,group,groupBy)

data Category =  Blue | Green | Orange | Purple | Red | Yellow 
  deriving (Eq,Ord,Show)

people = 
  [("Tim",24,Red,"Waterford")
  ,("Tom",36,Blue,"Tipperary")
  ,("Mary",19,Yellow,"Dublin")
  ,("Zach",41,Blue,"Tipperary")
  ,("Ann",9,Purple,"Wexford")
  ,("Jane",50,Red,"Waterford")
  ,("Harry",71,Green,"Cork")  
  ,("Jim",80,Blue,"Dublin")
  ,("Robert",23,Red,"Tipperary")
  ,("Lois",32,Green,"Wexford")
  ,("Barbara",50,Red,"Waterford")
  ,("Caleb",15,Yellow,"Cork")
  ,("Vicki",24,Red,"Waterford")
  ,("David",50,Green,"Waterford")
  ,("Justin",50,Purple,"Waterford")
  ,("Andrew",29,Red,"Waterford")
  ]

name   (nm,ag,clr,st) = nm  
age   (nm,ag,clr,st)  =  ag
category (nm,ag,clr,st)  = clr  
county (nm,ag,clr,st)  = st  


------------------------------------
-- the names of all people who live in Waterford

p1 = sort [name p | p <- people, county p == "Waterford"]
-------------------------------------------
-- How many people live in Tipperary

p2 = length  [name p | p <- people, county p == "Tipperary"] 


-------------------------------------------------
-- the list of ages of people who live in Cork

p3 = [name p | p <- people, county p == "Waterford"]

----------------------------------------------
-- The names of all people in the survey
-- in alphabetical order

p4 = sort[name p | p <- people]


----------------------------------------------------
-- The names and category of all people, sorted by category

p5:: [(String,Category)]
p5 = sortBy sortByCategory [(name p, category p) | p <- people]
     where sortByCategory (n1, col1) (n2, col2) = compare col1 col2


p5l:: [(String,Category)]
p5l = sortBy (\(n1, c1) (n2, c2) -> compare c1 c2) [(name p, category p) | p <- people]
--------------------------------------------------------
-- The category and the count of all those with that category

p6:: [(Category,Int)]
p6 = [(head xs, length xs) | xs <- group ( sort [category p | p <- people])]

-----------------------------------------------------
-- The category and a list of all names with that category

p7:: [(Category,[String])]
p7 =  [ (fst (head xs), [snd  x | x <- xs] ) |  xs <- groupBy (\(col1, n1) (col2, n2) -> col1 == col2) ( sort [(category p, name p) | p <- people] )  ]


----------------------------------------------
-- The names and ages of all those who live in Waterford
-- grouped by age.

p8:: [[(String,Integer)]]
p8 = group( sortBy (\(n1, a1) (n2, a2) -> compare a1 a2) [(name p, age p) | p<- people, county p == "Waterford"] )
