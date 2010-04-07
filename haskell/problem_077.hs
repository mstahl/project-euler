-- It is possible to write ten as the sum of primes in exactly five different
-- ways:
-- 
-- 7 + 3
-- 5 + 5
-- 5 + 3 + 2
-- 3 + 3 + 2 + 2
-- 2 + 2 + 2 + 2 + 2
-- 
-- What is the first value which can be written as the sum of primes in over five
-- thousand different ways?
-- 
-- http://projecteuler.net/index.php?section=problems&id=77

module Main where

import Combinatorics
import ONeillPrimes

myprimes = reverse $ primesToLimit 10000000

main = do print $ head $ filter (\n -> (length $ setsums myprimes n) > 5000) [1..10000000]