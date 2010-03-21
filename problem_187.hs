-- A composite is a number containing at least two prime factors. For example, 15
-- = 3 × 5; 9 = 3 × 3; 12 = 2 × 2 × 3.
-- 
-- There are ten composites below thirty containing precisely two, not necessarily
-- distinct, prime factors: 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.
-- 
-- How many composite integers, n < 10^(8), have precisely two, not necessarily
-- distinct, prime factors?
-- 
-- http://projecteuler.net/index.php?section=problems&id=187

module Main where

import Squarefrees  ((#), mergeAll)
import ONeillPrimes
import Data.List (nub)

limit = 10 ^ 6

-- myprimes = primesToLimit (limit `div` 2)

semiprimes = mergeAll [[p * q | q <- takeWhile (<=p) primes] | p <- primes]

main :: IO ()
main = do let sps = takeWhile (<limit) semiprimes
          print sps
          print $ length $ sps