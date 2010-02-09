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

triple :: Integral t => t -> t -> (t, t, t)
triple m n = (2 * m * n, (m ^ 2) - (n ^ 2), (m ^ 2) + (n ^ 2))

triples :: Integral t => [(t, t, t)]
triples = let triples' m = [triple m n | n <- [1..(m - 1)]]
          in concat $ map (triples') [2..1000]

perimeter :: Integral t => (t, t, t) -> t
perimeter (a, b, c) = a + b + c

uniques :: Integral t => [t] -> [t]
uniques = map (head) . filter (\l -> length l == 1)
                     . group . sort

main :: IO ()
main = do print $ length $ uniques $ filter (<1500000) $ map (perimeter) triples