-- data Node = Node Road (Maybe Road)
-- data Road = Road Int Node
data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)
type RoadSystem = [Section]

heathrowToLodon :: RoadSystem
heathrowToLodon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
  let priceA = sum $ map snd pathA
      priceB = sum $ map snd pathB
      forwardPriceToA = priceA + a
      crossPriceToA = priceB + b + c
      forwardPriceToB = priceB + b
      crossPriceToB = priceA + a + c
      newPathToA = if forwardPriceToA <= crossPriceToA
                      then (A,a):pathA
                      else (C,c):(B,b):pathB
      newPathToB = if forwardPriceToB <= crossPriceToB
                then (B,b):pathB
                else (C,c):(A,a):pathA
  in (newPathToA, newPathToB)

optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
  let (bestApath, bestBpath) = foldl roadStep ([], []) roadSystem
  in if sum (map snd bestApath) <= sum (map snd bestBpath)
       then reverse bestApath
       else reverse bestBpath
