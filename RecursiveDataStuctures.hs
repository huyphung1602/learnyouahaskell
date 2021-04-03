-- When we define functions as operators, we can use that to give them a fixity (but we don't have to).
-- A fixity states how tightly the operator binds and whether it's left-associative or right-associative.
-- For instance, *'s fixity is infixl 7 * and +'s fixity is infixl 6.
-- That means that they're both left-associative (4 * 3 * 2 is (4 * 3) * 2) but * binds tighter than +,
-- because it has a greater fixity, so 5 * 4 + 3 is (5 * 4) + 3.

-- infixr 5 :-:
-- data List a = Empty
--             | a :-: (List a) deriving (Show, Read, Eq, Ord)


-- infixr 5 .++
-- (.++) :: List a -> List a -> List a   
-- Empty .++ ys = ys  
-- (x :-: xs) .++ ys = x :-: (xs .++ ys) 

-- Implement Binary Search Tree
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a  
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | otherwise = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool 
treeElem x EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | otherwise = treeElem x right
