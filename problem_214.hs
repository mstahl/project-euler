-- Let φ be Euler's totient function, i.e. for a natural number n, φ(n) is the
-- number of k, 1 ≤ k ≤ n, for which gcd(k,n) = 1.
-- 
-- By iterating φ, each positive integer generates a decreasing chain of numbers
-- ending in 1.
-- 
-- E.g. if we start with 5 the sequence 5,4,2,1 is generated.
-- 
-- Here is a listing of all chains with length 4:
-- 
-- 5,4,2,1
-- 7,6,2,1
-- 8,4,2,1
-- 9,6,2,1
-- 10,4,2,1
-- 12,4,2,1
-- 14,6,2,1
-- 18,6,2,1
-- 
-- Only two of these chains start with a prime, their sum is 12.
-- 
-- What is the sum of all primes less than 40000000 which generate a chain of 
-- length 25?
-- 
-- http://projecteuler.net/index.php?section=problems&id=214

module Main where

import ONeillPrimes
import Totient

-- Chain length is memoized in a list
chain_length :: Integral t => Int -> t
chain_length = 
  let memo 0 = 1
      memo 1 = 1
      memo n = 1 + (chain_length $ totient n)
  in (map memo [0..] !!)

-- Un-memoized version for testing
-- chain_length :: Integral t => t -> Int
-- chain_length 1 = 1
-- chain_length n = 1 + (chain_length $ totient n)

eligible_primes :: Integral t => [t]
eligible_primes = primesToLimit 40000000

-- This is a function to spit back the full totient chain for a given value.
totient_chain :: Integral t => t -> [t]
totient_chain n | n == 1 = [1]
                | otherwise = n : totient_chain (totient n)

main :: IO ()
main = do let answers = filter (\n -> chain_length (n - 1) == 24)
                      $ eligible_primes
          print $ length eligible_primes
          print $ sum answers
