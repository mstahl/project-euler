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

limit = 10 ^ 8

-- pi1 and pi2 are the prime and semiprime counting functions, respectively
pi1 :: (Integral a) => a -> Int
pi1 x = length $ takeWhile (<=x) primes

pi2 :: (Integral a) => a -> Int
pi2 x = sum $ map (\(p, k) -> (pi1 (x `div` p)) - k + 1)
            $ zip primes [1..limit]
        where limit = pi1 . floor . sqrt . fromIntegral $ x

main :: IO ()
main = do print $ pi2 $ 10 ^ 8