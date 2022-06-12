data Bool' = True' | False' deriving (Show)

not' :: Bool' -> Bool'
not' True' = False'
not' False' = True'
