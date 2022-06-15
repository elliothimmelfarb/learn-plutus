data Bool' = True' | False' deriving (Show)

not' :: Bool' -> Bool'
not' True' = False'
not' False' = True'

-- Since there are overlaps with Prelude "||" you can acccess this with "Main.||" in ghci
(||) :: Bool -> Bool -> Bool
False || c = c
True || _ = True

ifThenElse :: Bool -> a -> a -> a
ifThenElse True t e = t
ifThenElse False t e = e

-- ifThenElse with guards
ifThenElse' :: Bool -> p -> p -> p
ifThenElse' c t e
  | c = t
  | otherwise = e

fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing = def
fromMaybe _ (Just a) = a

orElse :: Maybe a -> Maybe a -> Maybe a
orElse Nothing a = a
orElse (Just a) _ = Just a

addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes (Just a) (Just b) = Just (a + a)
addMaybes _ _ = Nothing