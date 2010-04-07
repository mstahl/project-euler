-- The radical of n, rad(n), is the product of distinct prime factors of n. For
-- example, 504 = 2^(3) × 3^(2) × 7, so rad(504) = 2 × 3 × 7 = 42.
-- 
-- We shall define the triplet of positive integers (a, b, c) to be an abc-hit if:
-- 
--    1. GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
--    2. a < b
--    3. a + b = c
--    4. rad(abc) < c
-- 
-- For example, (5, 27, 32) is an abc-hit, because:
-- 
--    1. GCD(5, 27) = GCD(5, 32) = GCD(27, 32) = 1
--    2. 5 < 27
--    3. 5 + 27 = 32
--    4. rad(4320) = 30 < 32
-- 
-- It turns out that abc-hits are quite rare and there are only thirty-one
-- abc-hits for c < 1000, with ∑c = 12523.
-- 
-- Find ∑c for c < 120000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=127

module Main where

import ONeillPrimes
import Data.List (nub)

hits :: Integral t => [(t, t, t)]
hits = [(a, b, c) | b <- [2..120000]
                  , a <- [1..(b - 1)]
                  , let c = a + b
                  , c < 120000
                  , all ((==)1) [a `gcd` b, a `gcd` c, b `gcd` c]
                  , (product $ concatMap (nub . prime_factors) [a, b, c]) < c
                  ]

cs :: Integral t => [t]
cs = map (\(_, _, c) -> c) hits

main :: IO ()
main = do print $ cs
          print $ length cs
          print $ sum cs

