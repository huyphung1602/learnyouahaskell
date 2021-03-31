-- maximum' :: (Ord a) => [a] -> a
-- maximum' [] = error "Maximum of empty list"
-- maximum' [x] = x
-- maximum' (x:xs)
--   | x > maxTail = x
--   | otherwise = maxTail
--   where maxTail = maximum' xs

-- Using max (max is a function that return the maximum number of 2 input numbers)
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

-- replicate takes an Int and some element and returns a list that has several repetitions of the same element.
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x:replicate' (n-1) x

-- take takes a certain number of elements from a list. For instance, take 3 [5,4,3,2,1] will return [5,4,3].
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs


-- reverse simply reverses a list.
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- repeat
repeat' :: a -> [a]
repeat' x = x:repeat' x

-- zip
-- zip [1,2,3] [2,3] returns [(1,2),(2,3)]
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


-- elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
  | a == x = True
  | otherwise = a `elem'` xs

-- Quick, Sort!
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
  let smallerSorted = quickSort [a | a <- xs, a <= x]
      biggerSorted = quickSort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted


-- Merge Sort
-- Test Data: [123,45,678,98,34,56,89,324,23,567,8,7,1]

-- define merge
merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] xs = xs
merge (x:xs) (y:ys)
  | x <= y = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys

-- Top down Version (for clarity, not for efficiency)
mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort xs = merge (mergeSort (firstHalf xs)) (mergeSort (secondHalf xs))

firstHalf  xs = let { n = length xs } in take (div n 2) xs
secondHalf xs = let { n = length xs } in drop (div n 2) xs


-- Bottom up Version
msort :: (Ord a) => [a] -> [a]
msort [] = []
msort xs = go [[x] | x <- xs]
  where
    go [a] = a
    go xs = go (pairs xs)
    pairs (a:b:t) = merge a b : t
    pairs t = t

-- Create a flat function that use for 2 dimension list
flatOne :: [[a]] -> [[a]]
flatOne (a:b:t) = (a ++ b) : t
flatOne t = t

flat :: [[a]] -> [a]
flat [x] = x
flat xs = flat (flatOne xs)
