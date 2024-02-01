Functional Programming – Lab Test 2
Develop  a Stack package called toTitleYourName (e.g. toTitleMaireadMeagher) by following the following steps
 
1. Create a new Stack Project (call it toTitleYourName)
2.  Build, install and run the default project.
3.  Change the project to implement the following:  
    - Read in a string from the user (from Main.hs)
    - Print back out the string in ‘title case’ (with the first letter of each work capitalised. 


4.	You should create a library module "Utils" which has a function toTitle which has the type :

        toTitle:: Text -> Text

5.  You should use the Data.Text package  (text) and its toTitle function (this returns the input Text in title form (e.g. “hello there” is returned as “Hello There”) 

6. You should use pack to convert a String into a Text value so that you can then use the Text functions (see details of pack on Hackage)

7. You will need to add text as a dependency. Only use dependencies where necessary. 

8. Zip up the package, upload on Moodle  and also push the finished code on GitHub Classroom. 
