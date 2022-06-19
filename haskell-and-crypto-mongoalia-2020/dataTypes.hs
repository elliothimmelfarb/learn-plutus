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
