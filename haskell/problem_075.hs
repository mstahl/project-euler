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
import Control.Parallel
import Control.Parallel.Strategies

triangles = [perimeter | n <- [2..1000]
                       , m <- [1..(n - 1)]
                       , gcd m n == 1
                       , odd (m + n)
                       , let perimeter = 2 * (n^2 + m*n)
                       , perimeter <= 2 * 10^6
                       ]

all_triangles = concatMap (\p -> takeWhile (<1500000) $ map (*p) [1..]) triangles

uniques :: Integral t => [t] -> [t]
uniques = map (head) . filter (\l -> length l == 1)
                     . group
                     . sort

main :: IO ()
main = do print $ length $ uniques $ all_triangles
