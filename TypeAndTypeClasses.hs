-- Remove upper case from the previous chapter
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- Add three
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z