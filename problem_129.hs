-- A number consisting entirely of ones is called a repunit. We shall define R(k)
-- to be a repunit of length k; for example, R(6) = 111111.
-- 
-- Given that n is a positive integer and GCD(n, 10) = 1, it can be shown that
-- there always exists a value, k, for which R(k) is divisible by n, and let A(n)
-- be the least such value of k; for example, A(7) = 6 and A(41) = 5.
-- 
-- The least value of n for which A(n) first exceeds ten is 17.
-- 
-- Find the least value of n for which A(n) first exceeds one-million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=129

module Main where

import MillerRabin (powMod, prime)
import ONeillPrimes (primes)

r_divisible_by :: Integral t => t -> t -> Bool
r_divisible_by k n = powMod n 10 k == 1

-- a :: Integral t => t -> t
-- a n = head $ filter (\k -> r_divisible_by k n) [1..]

-- a :: Integer -> Int
a n = (+) 1 $ length $ takeWhile ((/=)0) $ repunits
      where repunits = iterate (\r -> (10 * r + 1) `mod` n) 1

main :: IO ()
main = do let ns = [k | k <- [1000001,1000003..], gcd k 10 == 1]
          print $ head $ dropWhile (\n -> a n < 1000000) ns