-- It turns out that 12 cm is the smallest length of wire that can be bent to form
-- an integer sided right angle triangle in exactly one way, but there are many
-- more examples.
-- 
-- 12 cm: (3,4,5)
-- 24 cm: (6,8,10)
-- 30 cm: (5,12,13)
-- 36 cm: (9,12,15)
-- 40 cm: (8,15,17)
-- 48 cm: (12,16,20)
-- 
-- In contrast, some lengths of wire, like 20 cm, cannot be bent to form an
-- integer sided right angle triangle, and other lengths allow more than one
-- solution to be found; for example, using 120 cm it is possible to form exactly
-- three different integer sided right angle triangles.
-- 
-- 120 cm: (30,40,50), (20,48,52), (24,45,51)
-- 
-- Given that L is the length of the wire, for how many values of L 1,500,000 can
-- exactly one integer sided right angle triangle be formed?

module Main where

import Data.List

-- mergeAll stuff
(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll ([] : zs) = mergeAll zs
mergeAll (xxs@(x:xs) : yys@(y:ys) : zs)
    | x < y = x : mergeAll (xs : yys : zs)
    | otherwise = mergeAll ((xxs # yys) : zs)

coprime n m = n `gcd` m == 1

triple :: Integral t => t -> t -> t
triple m n = (m ^ 2) - (n ^ 2) + 2 * m * n + (m ^ 2) + (n ^ 2)

primitive_triples :: Integral t => [t]
primitive_triples = concat [[triple m n | n <- [1..(m - 1)]] | m <- [2..1414]]

multiples :: Integral t => t -> [t] -> [t]
multiples n (x:xs) = n * x : multiples n xs
multiples _ _ = []

all_triples :: Integral t => [t]
all_triples = sort $ concat $ [takeWhile (<1500000) $ multiples p [1..] | p <- primitive_triples]

uniques :: Integral t => [t] -> [t]
uniques = map (head) . filter (\l -> length l == 1)
                     . group

main :: IO ()
main = do print $ length $ uniques $ takeWhile (<1500000) $ all_triples
