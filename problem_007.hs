-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
-- the 6^(th) prime is 13.
-- 
-- What is the 10001^(st) prime number?
-- 
-- http://projecteuler.net/index.php?section=problems&id=7

module Main where

import ONeillPrimes

main :: IO ()
main = do print $ primes !! 10001