import Data.Char (isDigit, ord)
import Text.ParserCombinators.Parsec as P
import qualified  Control.Applicative  as CA

type ParserError = String

newtype Parser a = Parser { runParser :: String -> Either ParserError (a, String) }

instance Functor Parser where
  fmap f (Parser p) = Parser $ \input -> do
    (result, rest) <- p input
    Right (f result, rest)

instance Applicative Parser where
  pure x = Parser $ \input -> Right (x, input)
  (Parser f) <*> (Parser p) = Parser $ \input -> do
    (fun, rest1) <- f input
    (arg, rest2) <- p rest1
    Right (fun arg, rest2)

instance Monad Parser where
  return = pure
  (Parser p) >>= f = Parser $ \input -> do
    (result, rest) <- p input
    runParser (f result) rest
  fail msg = Parser $ \_ -> Left msg

-- Parse a single character
item :: Parser Char
item = Parser $ \input ->
  case input of
    [] -> Left "empty input"
    (c:cs) -> Right (c, cs)

-- Parse a specific character
char :: Char -> Parser Char
char c = do
  x <- item
  if x == c
    then return x
    else fail "unexpected character"

-- Parse zero or more occurrences of a parser
many :: Parser a -> Parser [a]
many p = do
  x <- optional p
  case x of
    Just x' -> do
      xs <- P.many p
      return (x':xs)
    Nothing -> return []

-- Parse zero or one occurrence of a parser
optional :: Parser a -> Parser (Maybe a)
optional p = fmap Just p CA.<|> return Nothing

-- Parse either the left parser or the right parser
(<|>) :: Parser a -> Parser a -> Parser a
(Parser p1) <|> (Parser p2) = Parser $ \input ->
  case p1 input of
    Left _ -> p2 input
    x -> x

-- Parse a string of digits into a list of integers
digit :: Parser Int
digit = fmap digitToInt $ satisfy isDigit
  where digitToInt c = ord c - ord '0'

digits :: Parser [Int]
digits = P.many digit

-- Parse a comma-separated list of integers
intList :: Parser [Int]
intList = do
  digits <- digits `sepBy` P.char ','
  P.optional $ P.char ','
  return digits

-- Parse the string "1,2,3"
example :: Either ParserError [Int]
example = P.runParser intList "1,2,3"
