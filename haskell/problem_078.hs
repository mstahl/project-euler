-- Let p(n) represent the number of different ways in which n coins can be
-- separated into piles. For example, five coins can separated into piles in
-- exactly seven different ways, so p(5)=7.
-- 
-- OOOOO
-- OOOO   O
-- OOO   OO
-- OOO   O   O
-- OO   OO   O
-- OO   O   O   O
-- O   O   O   O   O
-- 
-- Find the least value of n for which p(n) is divisible by one million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=78

module Main where

import qualified Data.Array as Array
import Data.Array ((!))

limit = 1000000

pentagonals = 
  let indices = concat [[i, -i] | i <- [1..]]
      p n = n * ((3 * n) - 1) `div` 2
  in map (p) indices

partitions = 
  let p 0 = 1 d
      p 1 = 1
      p k = 
        let terms = map (\p -> partitions (k - p)) $ takeWhile (<k) pentagonals
            coeffs = concat $ repeat [1, 1, -1, -1]
        in sum $ zipWith (*) terms coeffs
  in ((Array.array (0,limit) [(k, p k) | k <- [0..limit]]) !)

main :: IO ()
main = do print $ head $ filter (\k -> (partitions k) `mod` limit == 0) [2..]