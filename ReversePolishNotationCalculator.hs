-- Now we have enough information to roughly sketch our function.
-- It's going to take a string, like, "10 4 3 + 2 * -" and break
-- it down into a list of items by using words to get ["10","4","3","+","2","*","-"].
-- Next, we'll do a left fold over that list and end up with a stack that has a single
-- item, so [-4]. We take that single item out of the list and that's our final result!
import Data.List
 
solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
  where foldingFunction (x:y:ys) "*" = (x * y):ys
        foldingFunction (x:y:ys) "+" = (x + y):ys
        foldingFunction (x:y:ys) "-" = (x - y):ys
        foldingFunction (x:y:ys) "/" = (y/x):ys
        foldingFunction (x:y:ys) "^" = (y**x):ys
        foldingFunction (x:xs) "ln" = log x:xs
        foldingFunction xs "sum" = [sum xs]
        foldingFunction xs numberString = read numberString:xs
