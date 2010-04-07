-- The binomial coefficient ^(10)C_(3) = 120. 120 = 2^(3) × 3 × 5 = 2 × 2 × 2 ×
-- 3 × 5, and 2 + 2 + 2 + 3 + 5 = 14. So the sum of the terms in the prime
-- factorisation of ^(10)C_(3) is 14.
-- 
-- Find the sum of the terms in the prime factorisation of
-- ^(20000000)C_(15000000).
-- 
-- http://projecteuler.net/index.php?section=problems&id=231

module Main where

import ONeillPrimes (prime_factors)
import Data.List ((\\))

-- n = 20000000
-- k = 15000000
n = 200000
k = 150000


numerator = concatMap (prime_factors) [(n - k + 1)..n]
denominator = concatMap (prime_factors) [1..k]

main :: IO ()
main = do print $ sum $ numerator \\ denominator