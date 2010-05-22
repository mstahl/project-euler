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

import ONeillPrimes (prime_factors)
import Data.List (nub, group)
import Control.Parallel
import Control.Parallel.Strategies

num_divisors :: Integral t => t -> Int
num_divisors n = 
  let a_i = map (length) $ group $ prime_factors n
  in product $ map ((+)1) a_i

num_solutions :: Integral t => t -> Int
num_solutions n = (q + 1) `div` 2
                  where q = num_divisors $ n ^ 2

-- lengthWhile :: Integral t => (t -> Bool) -> [t] -> t
-- lengthWhile _ [] = 0
-- lengthWhile p (x:xs) | p x = succ $ lengthWhile p xs
--                      | otherwise = 0

lengthWhile :: (t -> Bool) -> [t] -> Int
lengthWhile p lst = length $ takeWhile p lst

main :: IO ()
main = do print $ lengthWhile (<1000) 
                $ parMap rwhnf (num_solutions) [0..]
