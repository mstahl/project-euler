-- Sigma module
-- 
-- Functions for computing the sigma (number/sum of divisors) function.

module Sigma where

import ONeillPrimes
import Data.List (group)

prime_factors_exp = map (\q -> (head q, length q)) . group . prime_factors

num_divisors n = 
  let pf = prime_factors_exp n
  in product $ map ((+1).snd) pf

divisors n = [d | d <- [1..(n `div` 2)], n `mod` d == 0] ++ [n]

-- sigma :: Integral t => t -> t -> t
sigma x n = 
  let pf = prime_factors_exp n
  in product $ map (\(p, a) -> sum $ map (\j -> p ^ (j * x)) [0..a]) pf