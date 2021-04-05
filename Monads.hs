type Birds = Int
type Pole = (Birds, Birds)

-- landLeft :: Birds -> Pole -> Pole
-- landLeft n (left, right) = (left + n, right)

-- landRight :: Birds -> Pole -> Pole
-- landRight n (left, right) = (left, right + n)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left,right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left,right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise                    = Nothing

-- landRight 1 (0,0) >>= landLeft 2 >>= landRight 3
-- Just (2,4)

-- landRight 1 (0,0) >>= landLeft 2 >>= landRight 3 >>= landLeft 10 >>= landRight 1
-- Nothing
