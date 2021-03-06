multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
  let smallerSorted = quickSort (filter' (<=x) xs)
      biggerSorted = quickSort (filter' (>x) xs)
  in  smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head (filter' p [100000,99999..])
  where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15

-- sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

-- elem' :: (Eq a) => a -> [a] -> Bool
-- elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys
elem' :: (Eq a) => a -> [a] -> Bool
elem' y = foldl (\acc x -> (x == y) || acc) False

-- mapF :: (a -> b) -> [a] -> [b]
-- mapF f xs = foldr (\x acc -> f x : acc) [] xs
mapF :: (a -> b) -> [a] -> [b]
mapF f = foldr (\x acc -> f x : acc) []

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filterF :: (a -> Bool) -> [a] -> [a]
filterF p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
-- head' = foldr1 (\x _ -> x)
head' = foldr1 const

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

headPm :: [a] -> a
headPm [] = error "Empty list"
headPm (x:xs) = x

-- How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
-- sqrtSums :: Int
-- sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

compose :: (b -> c) -> (a -> b) -> a -> c
f `compose` g = \x -> f (g x)
