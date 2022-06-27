data Bool' = True' | False' deriving (Show)

not' :: Bool' -> Bool'
not' True' = False'
not' False' = True'

-- Since there are overlaps with Prelude "||" you can acccess this with "Main.||" in ghci
(||||) :: Bool -> Bool -> Bool
False |||| c = c
True |||| _ = True

ifThenElse :: Bool -> a -> a -> a
ifThenElse True t e = t
ifThenElse False t e = e

-- ifThenElse with guards
ifThenElse' :: Bool -> p -> p -> p
ifThenElse' c t e
  | c = t
  | otherwise = e

{-- Maybe -}
fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing = def
fromMaybe _ (Just a) = a

orElse :: Maybe a -> Maybe a -> Maybe a
orElse Nothing a = a
orElse (Just a) _ = Just a

addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes (Just a) (Just b) = Just (a + a)
addMaybes _ _ = Nothing

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f (Just a) = Just (f a)
mapMaybe _ Nothing = Nothing

liftMaybe :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
liftMaybe f (Just a) (Just b) = Just (f a b)
liftMaybe _ _ _ = Nothing

{-- Pairs -}
swap' :: (a, b) -> (b, a)
swap' (a, b) = (b, a)

foo :: (Int, Int) -> Int
foo (a, b) = a + b

curry' :: ((a, b) -> c) -> a -> b -> c
curry' f a b = f (a, b)

{-- Lists -}

length' :: [a] -> Int
length' = foldr (\x -> (+) 1) 0

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y : ys) = x == y || elem x ys

append :: [a] -> [a] -> [a]
[] `append` ys = ys
(x : xs) `append` ys = x : (xs `append` ys)

head' :: [a] -> Maybe a
head' [] = Nothing
head' (x : ys) = Just x

tail' :: [a] -> Maybe [a]
tail' [] = Nothing
tail' (x : xs) = Just xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

{- Lookup Tables-}

type Table k v = [(k, v)]

empty :: Table k v
empty = []

insert :: Eq k => k -> v -> Table k v -> Table k v
insert k v t = (k, v) : filter (\(k', _) -> k' /= k) t

delete :: Eq k => k -> Table k v -> Table k v
delete k [] = []
delete k ((k', v) : t)
  | k == k' = delete k t
  | otherwise = (k', v) : delete k t

delete' :: Eq k => k -> Table k v -> Table k v
delete' k = filter (\kv -> k /= fst kv)

lookup' :: Eq k => k -> Table k v -> Maybe v
lookup' _ [] = Nothing
lookup' k ((k', v) : kvs)
  | k == k' = Just v
  | otherwise = lookup' k kvs

{- Transactions -}

type Amount = Int

type Account = String

data Transaction = Transaction Amount Account Account
  deriving (Eq, Show)

trAmount :: Transaction -> Amount
trAmount (Transaction a _ _) = a

trFrom :: Transaction -> Account
trFrom (Transaction _ a _) = a

trTo :: Transaction -> Account
trTo (Transaction _ _ a) = a

{- Record Syntax -}

data Transaction' = Transaction'
  { tr'Amount :: Amount,
    tr'From :: Account,
    tr'To :: Account
  }
  deriving (Eq, Show)

type Accounts = Table Account Amount

processTransaction :: Transaction' -> Accounts -> Accounts
processTransaction Transaction' {tr'From = f, tr'To = t, tr'Amount = x} a =
  let fOld = fromMaybe 0 (lookup f a)
      tOld = fromMaybe 0 (lookup t a)
   in insert f (fOld - x) (insert t (tOld + x) a)

{- Binary Trees -}

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

flatten :: Tree a -> [a]
flatten (Leaf x) = [x]
flatten (Node l r) = flatten l ++ flatten r

height :: Tree a -> Int
height (Leaf _) = 0
height (Node l r) = 1 + max (height l) (height r)

{- Expressions -}

data Expr
  = Lit Int
  | Add Expr Expr
  | Neg Expr
  | IfZero Expr Expr Expr
  deriving (Show)

expr1 :: Expr
expr1 =
  IfZero
    (Add (Lit 3) (Neg (Lit 3)))
    (Lit 42)
    (Add (Lit 1) (Lit 2))

eval :: Expr -> Int
eval (Lit x) = x
eval (Neg x) = - eval x
eval (Add x y) = eval x + eval y
eval (IfZero x y z)
  | eval x == 0 = eval y
  | otherwise = eval z
