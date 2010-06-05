-- Consider numbers t(n) of the form t(n) = 2n^(2)-1 with n > 1. The first such
-- numbers are 7, 17, 31, 49, 71, 97, 127 and 161. It turns out that only 49 = 7*7
-- and 161 = 7*23 are not prime. For n ≤ 10000 there are 2202 numbers t(n) that
-- are prime.
-- 
-- How many numbers t(n) are prime for n ≤ 50,000,000 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=216

module Main where

import MillerRabin (millerRabinPrimality)
import ONeillPrimes (primes)

prime :: Integer -> Bool
prime n | n < 2 = True
        | n `elem` [2,3,5,7,11,13,17,23] = True
        | n < 341550071728321 = all (millerRabinPrimality n) [2,3,5,7,11,13,17]
        | otherwise = all (millerRabinPrimality n) myprimes
                      where myprimes = takeWhile (<=2613) primes

tns = [n | n <- [2..50000000], prime (2 * (n ^ 2) - 1)]

main :: IO ()
main = do print $ length tns