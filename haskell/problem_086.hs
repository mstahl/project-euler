-- A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and
-- a fly, F, sits in the opposite corner. By travelling on the surfaces of the
-- room the shortest "straight line" distance from S to F is 10 and the path is
-- shown on the diagram.
-- 
-- [diagram]
-- 
-- However, there are up to three "shortest" path candidates for any given
-- cuboid and the shortest route is not always integer.
-- 
-- By considering all cuboid rooms with integer dimensions, up to a maximum
-- size of M by M by M, there are exactly 2060 cuboids for which the shortest
-- distance is integer when M=100, and this is the least value of M for which
-- the number of solutions first exceeds two thousand; the number of solutions
-- is 1975 when M=99.
-- 
-- Find the least value of M such that the number of solutions first exceeds
-- one million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=86

module Main where

import Data.List

-- This is basically like asking how many pythagorean triples there are with 
-- base and height less than 2M. 

big_m = 99

triples = [(a, b, c) | m <- [1..10000]
                     , n <- [1..(m - 1)]
                     , let a = (m ^ 2) - (n ^ 2)
                     , let b = 2 * m * n
                     , let c = (m ^ 2) + (n ^ 2)
                     , all (<=big_m) [a, b, c]
                     ]

main :: IO ()
main = do print $ length triples