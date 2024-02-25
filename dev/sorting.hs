module ComparingSortingGrouping  where
-- From Tim Sheard
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

p3 = undefined

----------------------------------------------
-- The names of all people in the survey
-- in alphabetical order

p4 = undefined

----------------------------------------------------
-- The names and category of all people, sorted by category

p5:: [(String,Category)]
p5 = undefined
--------------------------------------------------------
-- The category and the count of all those with that category

p6:: [(Category,Int)]
p6 =  undefined

-----------------------------------------------------
-- The category and a list of all names with that category

p7:: [(Category,[String])]
p7 = undefined


----------------------------------------------
-- The names and ages of all those who live in Waterford
-- grouped by age.

p8:: [[(String,Integer)]]
p8 = undefined
