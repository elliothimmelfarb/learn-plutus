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