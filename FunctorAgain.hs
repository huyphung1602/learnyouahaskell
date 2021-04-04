-- main :: IO ()
-- main = do line <- fmap reverse getLine
--           putStrLn $ "You said " ++ line ++ " backwards!"
--           putStrLn $ "Yes, you really said " ++ line ++ " backwards!"

-- import Data.Char ( toUpper )
-- import Data.List ( intersperse )

-- main :: IO ()
-- main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
--           putStrLn line

data CMaybe a = CNothing | CJust a deriving (Show)

instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust x) = CJust (f x)
