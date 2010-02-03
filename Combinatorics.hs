module Combinatorics where

import List (inits, tails, delete)

cartProd (set:sets) = let cp = cartProd sets in [x:xs | x <- set, xs <- cp]
cartProd [] = [[]]


powerset [] = [[]]
powerset (x:xs) = let p = powerset xs in p ++ map (x:) p

-- subsets of size k
combinationsOf 0 _ = [[]]
combinationsOf _ [] = []
combinationsOf k (x:xs) = map (x:) (combinationsOf (k-1) xs) ++ combinationsOf k xs

combinations k n = combinationsOf k [1..n]


permutations n = permutationsOf [1..n]

permutationsOf [] = [[]]
permutationsOf xs = [x:xs' | x <- xs, xs' <- permutationsOf (delete x xs)]
-- permutationsOf (x:xs) = [ p ++ [x] ++ s | xs' <- permutationsOf xs, (p,s) <- zip (inits xs') (tails xs') ]


-- given n, xs, return the ways that n can be expressed as a sum of xs
-- repeats are allowed, order is irrelevant
-- for efficiency, xs should be in descending order, in which case answers will also be in descending order
setsums [] 0 = [[]]
setsums [] _ = []
setsums (x:xs) n | x > n     = setsums xs n
                 | otherwise = map (x:) (setsums (x:xs) (n-x)) ++ setsums xs n

partitions n = setsums (reverse [1..n]) n

sum4squares n = [s | s <- setsums squares n, length s <= 4]
    where squares = reverse $ takeWhile (<= n) [k*k | k <- [1..] ]



-- Stanley, Enumerative Combinatorics vol 1, p14

compositions 0 = [[]]
compositions n = [x:xs | x <- [1..n], xs <- compositions (n-x)]
