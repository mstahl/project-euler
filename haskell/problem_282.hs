-- For non-negative integers m, n, the Ackermann function A(m, n) is defined as 
-- follows:
-- 
-- A(m, n) | m == 0           = n + 1
--         | m > 0 and n == 0 = A(m - 1, 1)
--         | m > 0 and n > 0  = A(m - 1, A(m, n - 1))
-- 
-- For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.
-- 
-- Find ∑_(0 ≤ n ≤ 6) A(n, n) and give your answer mod 14^(8).
-- 
-- http://projecteuler.net/index.php?section=problems&id=282

module Main where

import Data.Array.Unboxed
import MillerRabin (powMod)

-- modulus = 14 ^ 8
modulus = 14 ^ 7

(.^^.) :: Integer -> Integer -> Integer
a .^^. 1 = a
a .^^. (k + 1) = powMod modulus a (a .^^. k)

-- A(4, 4) = 2^^7 - 3
-- A(5, 5) = 2^^^8 - 3 = 2^^2^^2^^2^^2^^2^^2^^2 - 3

main :: IO ()
main = do print $ (2 .^^. 7) - 3
          print $ foldl1 (powMod modulus) $ take 7 $ repeat 2
