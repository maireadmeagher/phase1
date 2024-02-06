import System.IO  
import Control.Monad

data Maybe' a = Just' a | Nothing'

instance Monad Maybe' where
Nothing' >>= _ = Nothing'
(Just' x ) >>=  f =  f x
