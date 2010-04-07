-- A number consisting entirely of ones is called a repunit. We shall define R(k)
-- to be a repunit of length k; for example, R(6) = 111111.
-- 
-- Given that n is a positive integer and GCD(n, 10) = 1, it can be shown that
-- there always exists a value, k, for which R(k) is divisible by n, and let A(n)
-- be the least such value of k; for example, A(7) = 6 and A(41) = 5.
-- 
-- You are given that for all primes, p > 5, that p − 1 is divisible by A(p). For
-- example, when p = 41, A(41) = 5, and 40 is divisible by 5.
-- 
-- However, there are rare composite values for which this is also true; the first
-- five examples being 91, 259, 451, 481, and 703.
-- 
-- Find the sum of the first twenty-five composite values of n for which GCD(n,
-- 10) = 1 and n − 1 is divisible by A(n).
-- 
-- http://projecteuler.net/index.php?section=problems&id=130

module Main where

import MillerRabin (powMod, prime)
import ONeillPrimes (primes)
import Data.List ((\\))

-- k `r_divisible_by` n
-- True if R(k) is divisible by n.
r_divisible_by :: Integral t => t -> t -> Bool
r_divisible_by k n = powMod n 10 k == 1

-- log10 :: (Floating a) => a -> a
log10 n = (log n) / (log 10.0)

-- repunits :: [Integer]
repunits = iterate (\r -> 10 * r + 1) 1

-- a :: Integer -> Int
a n = (+) 1 $ length $ takeWhile (\r -> r `mod` n /= 0) $ repunits

-- a n = head $ filter (\k -> r_divisible_by k n) [l..]
--       where l = ceiling . log10 . fromIntegral $ 9 * n - 1

answers = [ c | c <- [1..]
              , gcd c 10 == 1
              , not . prime $ c
              , (c - 1) `mod` (fromIntegral . a $ c) == 0
              ]

main :: IO ()
main = do let goal = [91, 259, 451, 481, 703]
          print $ goal
          print $ take 25 answers
          print $ sum $ take 25 answers


