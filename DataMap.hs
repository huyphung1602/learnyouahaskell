phoneBook =
  [("betty","555-2938")
  ,("bonnie","452-2928")
  ,("patsy","493-2928")
  ,("lucille","205-2928")
  ,("wendy","939-8282")
  ,("penny","853-2492")
  ]

-- findKey :: (Eq k) => k -> [(k,v)] -> v
-- findKey key xs = snd(head(filter (\(k, v) -> key == k) xs))
-- findKey key xs = snd . head .filter (\(k, v) -> key == k) $ xs
-- findKey key = snd . head .filter (\(k, v) -> key == k)

-- findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
-- findKey key [] = Nothing
-- findKey key ((k,v):xs) = if key == k
--                             then Just v
--                             else findKey key xs

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing
