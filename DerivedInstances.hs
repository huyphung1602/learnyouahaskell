data Person =
  Person { firstName :: String
         , lastName :: String
         , age :: Int
         } deriving (Eq)

data Day = Monday 
         | Tuesday
         | Wednesday
         | Thursday
         | Friday
         | Saturday
         | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum)


-- succ Monday
-- pred Saturday
-- [Thursday .. Sunday]  
-- [minBound .. maxBound] :: [Day]
