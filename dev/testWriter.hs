import Control.Monad
import Control.Monad.Trans.Writer.Strict
import Data.Monoid  

data LogEntry = LogEntry { msg::String }
  deriving (Eq, Show)

calc :: Writer [LogEntry] Integer
calc = do
  output "start"
  let x = sum [1..10000000]
  output (show x)
  output "done"
  return x

output :: String -> Writer [LogEntry] ()
output x = tell [LogEntry x]

test = mapM_ print $ execWriter calc

---

  
type Food = String  
type Price =  Int  
  
addDrink :: Food -> (Food,Price)  
addDrink "beans" = ("milk", 25)  
addDrink "jerky" = ("whiskey", 99)  
addDrink _ = ("beer", 30)  

applyLog :: (a,String) -> (a -> (b,String)) -> (b,String)  
applyLog (x,log) f = let (y,newLog) = f x in (y,log ++ newLog)  