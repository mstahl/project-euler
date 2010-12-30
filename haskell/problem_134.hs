-- Consider the consecutive primes p_(1) = 19 and p_(2) = 23. It can be verified
-- that 1219 is the smallest number such that the last digits are formed by p_(1)
-- whilst also being divisible by p_(2).
-- 
-- In fact, with the exception of p_(1) = 3 and p_(2) = 5, for every pair of
-- consecutive primes, p_(2) > p_(1), there exist values of n for which the last
-- digits are formed by p_(1) and n is divisible by p_(2). Let S be the smallest
-- of these values of n.
-- 
-- Find ∑ S for every pair of consecutive primes with 5 ≤ p_(1) ≤ 10^6.
-- 
-- http://projecteuler.net/index.php?section=problems&id=134

module Main where

import ONeillPrimes
import Text.Printf

import Control.Parallel
import Control.Parallel.Strategies

myprimes = primesToLimit $ 100000

num_digits n = length $ show n

s p1 p2 = 
  let p1l = num_digits p1
      s' m | m == p1 = 1
           | otherwise = 1 + (s' $ (m + p2) `mod` (10 ^ p1l))
  in s' 0

answers = drop 2 $ parZipWith rwhnf s (myprimes) (tail myprimes)
-- answers = drop 2 $ zipWith s (myprimes) (tail myprimes)

main :: IO ()
main = do -- mapM_ (\(i, a) -> printf "%8d: %d\n" (i::Int) (a::Integer)) $ zip myprimes answers
          print $ sum answers
