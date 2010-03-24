-- For non-negative integers m, n, the Ackermann function A(m, n) is defined as
-- follows:
-- 
-- For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.
-- 
-- Find ∑_(0 ≤n ≤ 6) A(n, n) and give your answer mod 14^(8).
-- 
-- http://projecteuler.net/index.php?section=problems&id=282

module Main where

ackermann m n | m == 0 = n + 1
              | m > 0 && n == 0 = ackermann (m - 1) 1
              | m > 0 && n > 0 = ackermann (m - 1) (ackermann m (n - 1))

up n a b | n == 1 = a ^ b
         | b == 0 = 1
         | otherwise = up (n - 1) a (up n a (b - 1))