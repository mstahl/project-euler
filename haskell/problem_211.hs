-- For a positive integer n, let σ_(2)(n) be the sum of the squares of its
-- divisors. For example,
-- 
-- σ_(2)(10) = 1 + 4 + 25 + 100 = 130.
-- 
-- Find the sum of all n, 0 < n < 64,000,000 such that σ_(2)(n) is a perfect
-- square.
-- 
-- http://projecteuler.net/index.php?section=problems&id=211

module Main where

import Sigma

perfect_square :: Integral t => t -> Bool
perfect_square n = (round . sqrt . fromIntegral $ n) ^ 2 == n

main :: IO ()
-- main = do print $ sum $ filter (perfect_square) $ map (sigma 2) [1..63999999]
main = do print $ sum $ filter (perfect_square) $ map (sigma 2) [1..999999]