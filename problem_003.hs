-- The prime factors of 13195 are 5, 7, 13 and 29.
-- 
-- What is the largest prime factor of the number 600851475143 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=3

module Main where

import ONeillPrimes

main :: IO ()
main = do print $ maximum $ prime_factors 600851475143