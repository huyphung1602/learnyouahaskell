import BirdPoleLand

-- foo :: Maybe String
-- foo = Just 3   >>= (\x ->
--       Just "!" >>= (\y ->
--       Just (show x ++ y)))
foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

marySue :: Maybe Bool
marySue = do
  x <- Just 9
  Just (x > 8)

routine :: Maybe Pole
routine = do
  let start = (0,0)
  first <- landLeft 2 start
  Nothing
  second <- landRight 2 first
  landLeft 1 second
