-- 2520 is the smallest number that can be divided by each of the numbers from 1
-- to 10 without any remainder.
-- 
-- What is the smallest number that is evenly divisible by all of the numbers from
-- 1 to 20?
-- 
-- http://projecteuler.net/index.php?section=problems&id=5

module Main where

import ONeillPrimes

best_power_below :: Integral t => t -> t -> t
best_power_below max p = last $ takeWhile (<max) $ iterate (*p) 1

lcm_to_limit n = product $ map (best_power_below n) $ primesToLimit n

main :: IO ()
main = do print $ lcm_to_limit 20
