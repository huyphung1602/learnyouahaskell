
-- import Control.Monad ( forM )

-- main :: IO [()]
-- main = do
--   colors <- forM [1,2,3,4] (\a -> do
--     putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
--     getLine)
--   putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
--   mapM putStrLn colors

main :: IO [()]
main = do
  colors <- mapM (\a -> do
    putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
    getLine) [1,2,3,4]
  putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
  mapM putStrLn colors
