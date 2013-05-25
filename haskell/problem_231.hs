-- The binomial coefficient ^(10)C_(3) = 120. 120 = 2^(3) × 3 × 5 = 2 × 2 × 2 ×
-- 3 × 5, and 2 + 2 + 2 + 3 + 5 = 14. So the sum of the terms in the prime
-- factorisation of ^(10)C_(3) is 14.
-- 
-- Find the sum of the terms in the prime factorisation of
-- ^(20000000)C_(15000000).
-- 
-- http://projecteuler.net/index.php?section=problems&id=231

module Main where

import ONeillPrimes (primes, composites)

n' = 20000000
k' = 15000000

sum_of_factors :: Integral t => t -> t -> t
sum_of_factors p = sum . takeWhile (>0) 
                       . tail
                       . iterate (\n -> n `div` p)

sum_of_factors_combination :: Integral t => t -> t -> t
sum_of_factors_combination n k =
  sum $ map (\i -> ((sum_of_factors i n)
                  - (sum_of_factors i k)
                  - (sum_of_factors i (n - k))) * i)
      $ takeWhile (<=n) primes

main :: IO ()
main = do print $ sum_of_factors_combination n' k'
