-- main :: IO ()
-- main = do
--   c <- getChar
--   if c /= ' '
--     then do
--       putChar c
--       main
--     else return ()

-- import Control.Monad ( when )

-- main :: IO ()
-- main = do
--   c <- getChar
--   when (c /= ' ') $ do
--     putChar c
--     main

-- main :: IO ()
-- main = do  
--   rs <- sequence [getLine, getLine, getLine]  
--   print rs

-- import Control.Monad (forever)
-- import Data.Char (toUpper)

-- main :: IO b
-- main = forever $ do
--   putStr "Give me some input: "
--   l <- getLine
--   putStrLn $ map toUpper l
