-- For non-negative integers m, n, the Ackermann function A(m, n) is defined as 
-- follows:
-- 
-- A(m, n) | m == 0           = n + 1
--         | m > 0 and n == 0 = A(m - 1, 1)
--         | m > 0 and n > 0  = A(m - 1, A(m, n - 1))
-- 
-- For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.
-- 
-- Find ∑_(0 ≤n ≤ 6) A(n, n) and give your answer mod 14^(8).
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

main :: IO ()
main = do mapM_ print [2 .^^. n | n <- [1..1500]]

-- Has the following output:
-- 2731
-- 120858291
-- 224021715
-- 1149386323
-- 1295674451
-- 301775699
-- 934256723
-- 934256723
-- 934256723
-- 934256723
-- 934256723
-- 934256723
-- 934256723
-- 934256723
-- 934256723