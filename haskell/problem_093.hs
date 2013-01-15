-- By using each of the digits from the set, {1, 2, 3, 4}, exactly once, and
-- making use of the four arithmetic operations (+, , *, /) and
-- brackets/parentheses, it is possible to form different positive integer
-- targets.
-- 
-- For example,
-- 
-- 8 = (4 * (1 + 3)) / 2
-- 14 = 4 * (3 + 1 / 2)
-- 19 = 4 * (2 + 3)  1
-- 36 = 3 * 4 * (2 + 1)
-- 
-- Note that concatenations of the digits, like 12 + 34, are not allowed.
-- 
-- Using the set, {1, 2, 3, 4}, it is possible to obtain thirty-one different
-- target numbers of which 36 is the maximum, and each of the numbers 1 to 28 can
-- be obtained before encountering the first non-expressible number.
-- 
-- Find the set of four distinct digits, a  b < c  d, for which the longest set of
-- consecutive positive integers, 1 to n, can be obtained, giving your answer as a
-- string: abcd.
--
-- http://projecteuler.net/problem=93

module Main where

import Combinatorics

import Data.List

is_integer n = (fromIntegral $ floor n) == n

consecutives (a:b:xs) | b - a == 1 = a : consecutives (b : xs)
                      | otherwise = [a]
consecutives [a] = [a]
consecutives _ = []

targets = [ (map (fromIntegral . floor) digits, list)
          | x' <- [4..9]
          , y' <- [3..x']
          , z' <- [2..y']
          , w' <- [1..z']
          , let digits = [x', y', z', w']
          , let list = consecutives $ sort 
                                    $ nub [ fromIntegral $ floor q 
                                          | a <- [(+), (-), (*), (/)]
                                          , b <- [(+), (-), (*), (/)]
                                          , c <- [(+), (-), (*), (/)]
                                          , [x, y, z, w] <- permutationsOf digits
                                          , let q = (a (b (c x y) z) w)
                                          , is_integer q
                                          , q > 0
                                          ]
          , head list == 1
          ]

main :: IO ()
-- main = do print targets
main = do mapM_ print $ sortBy (\a b -> (length $ snd a) `compare` (length $ snd b)) targets
