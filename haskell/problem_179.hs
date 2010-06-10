-- Find the number of integers 1 < n < 10^(7), for which n and n + 1 have the same
-- number of positive divisors. For example, 14 has the positive divisors 1, 2, 7,
-- 14 while 15 has 1, 3, 5, 15.
-- 
-- http://projecteuler.net/index.php?section=problems&id=179

module Main where

import Data.Array.Unboxed
import Sigma

import Control.Parallel
import Control.Parallel.Strategies

mx = 10^5 - 1
-- mx = 25

-- sigmas :: [Int]
sigmas = tail $ foldl1 (\a b -> zipWith (+) a b) 
              $ [cycle 1:(take n $ repeat 0) | n <- [2..mx]]

main :: IO ()
main = do mapM_ (print) sigmas
          -- print $ sum $ zipWith (\a b -> if snd a == snd b then 1 else 0) sigmas $ tail sigmas

