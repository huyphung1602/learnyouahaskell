import Data.Char ( toUpper )

-- main :: IO ()
-- main = do
--   contents <- getContents
--   putStr (shortLinesOnly contents)

-- main :: IO ()
-- main = interact shortLinesOnly

-- shortLinesOnly :: String -> String  
-- shortLinesOnly input =   
--     let allLines = lines input  
--         shortLines = filter (\line -> length line < 10) allLines  
--         result = unlines shortLines  
--     in  result

main :: IO ()
main = interact respondPalindromes
respondPalindromes :: String -> String
respondPalindromes = unlines . map (\xs -> if isPalindrome xs then "palindrome" else "not a palindrome") . lines  
  where isPalindrome xs = xs == reverse xs
