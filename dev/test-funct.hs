import Data.Char  
import Data.List  
  
-- main = do line <- fmap ( reverse . map toUpper) getLine  
--           putStrLn line (-1) 3

main = do line <- fmap reverse getLine  
          putStrLn $ "You said " ++ line ++ " backwards!"  
          putStrLn $ "Yes, you really said " ++ line ++ " backwards!" 
