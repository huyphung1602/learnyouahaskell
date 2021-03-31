-- Guards examples
bmiTell1 :: (RealFloat a) => a -> String
bmiTell1 bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
  | weight/height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | weight/height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | weight/height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b

-- Another way: max' a b | a > b = a | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
myCompare a b
  | a > b = GT
  | a == b = EQ
  | otherwise = LT

-- where bindings
bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2

bmiTell4 :: (RealFloat a) => a -> a -> String
bmiTell4 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"
  | otherwise     = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

bmiTell5 :: (RealFloat a) => a -> a -> String
bmiTell5 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"
  | otherwise     = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi weight height = weight/height ^ 2

-- let bindings
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^2
  in  sideArea + 2 * topArea


calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
