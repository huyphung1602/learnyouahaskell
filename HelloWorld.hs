import Data.Char

-- What's your name? How are you?
-- main :: IO ()
-- main = do
  -- putStrLn "What's your first name?"
  -- firstName <- getLine
  -- putStrLn "What's your last name?"
  -- lastName <- getLine
  -- let bigFirstName = map toUpper firstName
  --     bigLastName = map toUpper lastName
  -- putStrLn $ "Hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"

-- Reverse input
-- main :: IO ()
-- main = do
--   line <- getLine
--   if null line
--     then return ()
--     else do
--       putStrLn $ reverseWords line
--       main

-- reverseWords :: String -> String
-- reverseWords = unwords . map reverse . words

main :: IO ()
main = do
  a <- return "Hell"
  b <- return "Yeah"
  putStrLn $ a ++ " " ++ b
