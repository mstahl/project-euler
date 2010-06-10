-- Consider numbers t(n) of the form t(n) = 2n^(2)-1 with n > 1. The first such
-- numbers are 7, 17, 31, 49, 71, 97, 127 and 161. It turns out that only 49 = 7*7
-- and 161 = 7*23 are not prime. For n ≤ 10000 there are 2202 numbers t(n) that
-- are prime.
-- 
-- How many numbers t(n) are prime for n ≤ 50,000,000 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=216

module Main where

import MillerRabin (prime)
import ONeillPrimes (primes,prime_factors_exponents)
import Sigma
import Data.List (scanl1,group)

perfect_square n = m * m == n where m = round $ sqrt $ fromIntegral n

-- limit = 50000000
limit = 10000

increasing :: Ord a => [a] -> [a]
increasing (a:(b:xs)) | a == b = increasing (b:xs)
                      | a < b = a : increasing (b:xs)
                      | a > b = increasing (a:xs)
increasing _ = []

a160696 = 
  let largest p = last $ filter (\(p, i) -> i > 1)
                       $ prime_factors_exponents (p + 1)
  in map largest primes

ns = [n | n <- [2..limit]
        , (sigma 1 n) `mod` (sigma 0 n) == 0
        , perfect_square n
        ]

main :: IO ()
main = do print $ length $ ns

