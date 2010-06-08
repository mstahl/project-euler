-- Consider numbers t(n) of the form t(n) = 2n^(2)-1 with n > 1. The first such
-- numbers are 7, 17, 31, 49, 71, 97, 127 and 161. It turns out that only 49 = 7*7
-- and 161 = 7*23 are not prime. For n ≤ 10000 there are 2202 numbers t(n) that
-- are prime.
-- 
-- How many numbers t(n) are prime for n ≤ 50,000,000 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=216

module Main where

import MillerRabin (prime)

perfect_square n = m * m == n where m = round $ sqrt $ fromIntegral n

-- limit = 50000000
limit = 200

ns = [n | n <- [2..limit], prime $ 2 * n * n - 1]

main :: IO ()
main = do print $ length $ ns
          print $ ns

