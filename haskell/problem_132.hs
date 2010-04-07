-- A number consisting entirely of ones is called a repunit. We shall define R(k)
-- to be a repunit of length k.
-- 
-- For example, R(10) = 1111111111 = 11×41×271×9091, and the sum of these prime
-- factors is 9414.
-- 
-- Find the sum of the first forty prime factors of R(10^(9)).
-- 
-- http://projecteuler.net/index.php?section=problems&id=132

module Main where

import ONeillPrimes
import MillerRabin (powMod)

digits = 10 ^ 9

main = do print $ sum 
                $ take 40 
                $ filter (\x -> (powMod x 10 digits) == 1) 
                $ drop 3 primes