-- 2520 is the smallest number that can be divided by each of the numbers from 1
-- to 10 without any remainder.
-- 
-- What is the smallest number that is evenly divisible by all of the numbers from
-- 1 to 20?
-- 
-- http://projecteuler.net/index.php?section=problems&id=5

module Main where

import Control.Parallel
import Control.Parallel.Strategies

divisible_by_all :: Integral t => t -> Bool
divisible_by_all n = all (\r -> n `mod` r == 0) [2..20]

-- main :: IO ()
-- main = do print $ head $ filter (divisible_by_all) [20,40..]

main = do print $ head $ filter fst $ parBuffer 16 rseq $ map (\q -> (divisible_by_all q, q)) [20,40..]
