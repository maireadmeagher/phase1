-- SECTION B - Precendences
-- Please fill in your name and student number
-- Student Name : 
-- Student Number : 

-- This section is worth  30 Marks



--  In this section replace each "X2 = undefined" with "X2 = fully-parenthesiszed-expression"



-- such that X1 and X2 evaluate to the same value.


-- you should use ghci to check is your answer correct.

--- For example I have done "a2" below



a1 = 3 + 5 * 5

a2 = (3 + (5 * 5))





------------------------------

b1:: Bool

b1 = 20 == 12 + 4 - 2

b2 = undefined


------------------------------

c1 = length [5,7,6] + 8 `div` 6

c2 = undefined



-----------------------------

d1 = 5 ^ length  (tail [3,3,4])

d2 =  undefined



-----------------------------

e1 = head [2,3,4]  ^ 8 `div` 3

e2 = undefined



-----------------------------

f1 = 3 == 4  &&  2 < 5 `div` 3

f2 = undefined



------------------------------

g1 = 5 < 10  && 3 < 4 ^0

g2 = undefined



h1 = 3^3*2 <60  && even 4

h2 = undefined

allComplete = a1 == a1 && b1 == b2 && c1 == c2 && d1 == d2 && e1 == e2 && f1 == f2 && g1 == g2 && h1 == h2
-- This should be called whan all the x2 functions are written (changed from 'undefined'). If it returns true, then all are working.



-- SECTION C - TYPES
-- Please fill in your name and student number
-- Student Name : 
-- Student Number : 
--This section is worth  30 Marks

-- For each named expression replace "undefined"

-- with an expression with the same type as the declaration

-- Note where the answer is a list, you will not get marks for giving an empty list as an answer, 

-- even though it is syntactically correct. (Nice idea, though!)



j1:: (String,Integer)

j1 = undefined

-- possible answer here would be 

-- j1 = ("Me", 1)



j2:: [Double]

j2 =  undefined



j3:: (String, [Integer])

j3 =  undefined



j4:: [[Char]]

j4 = undefined



j5:: ([Integer],[Char],Char)

j5 =  undefined



j6:: (Integer,(String,Integer, Bool))

j6 = undefined



j7:: [(Double, String)]

j7 =  undefined



j8:: [[(Integer,Bool, [Bool])]]

j8 = undefined