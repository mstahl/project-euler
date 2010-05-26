-- Find the number of integers 1 < n < 10^(7), for which n and n + 1 have the same
-- number of positive divisors. For example, 14 has the positive divisors 1, 2, 7,
-- 14 while 15 has 1, 3, 5, 15.
-- 
-- http://projecteuler.net/index.php?section=problems&id=179

module Main where

import Data.Array.Unboxed
import Sigma

-- sigmas :: UArray Int64
sigmas = array (2, 10^7-1) [(n, num_divisors n) | n <- [2..(10^7-1)]]

main :: IO ()
-- main = do print $ sigmas ! 12

