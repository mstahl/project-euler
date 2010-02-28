-- In the following equation x, y, and n  are positive integers.
-- 
-- 1   1   1
-- - + - = -
-- x   y   n
-- 
-- For n = 4 there are exactly three distinct solutions:
-- 
-- 1    1   1
-- - + -- = -
-- 5   20   4
-- 
-- 1    1   1
-- - + -- = -
-- 6   12   4
-- 
-- 1   1   1
-- - + - = -
-- 8   8   4
-- 
-- What is the least value of n for which the number of distinct solutions exceeds one-thousand?
-- 
-- http://projecteuler.net/index.php?section=problems&id=108

module Main where

import ONeillPrimes (factors)
import Data.List (nub)

num_solutions :: Integral t => t -> Int
num_solutions n = (q + 1) `div` 2
                  where q = length $ factors $ n ^ 2

main :: IO ()
main = do print $ length $ takeWhile (\n -> (num_solutions n) < 1000) [1..]