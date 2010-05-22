-- In the following equation x, y, and n  are positive integers.
-- 
-- 1   1   1
-- - + - = -
-- x   y   n
-- 
-- It can be verified that when n = 1260 there are 113 distinct solutions and this
-- is the least value of n for which the total number of distinct solutions
-- exceeds one hundred.
-- 
-- What is the least value of n for which the number of distinct solutions exceeds
-- four million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=110

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
