-- For non-negative integers m, n, the Ackermann function A(m, n) is defined as follows:
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

-- ackermanns :: UArray (Int, Int) Int
-- ackermanns = array ((0, 0),(6, 6)) [((m, n), ackermann m n) | m <- [0..6], n <- [0..6]]

modulus = 14 ^ 8

ackermann m n = 
  let ackermann' m n | m == 0 = n + 1
                     | m > 0 && n == 0 = ackermann (m - 1) 1
                     | m > 0 && n > 0 = ackermann (m - 1) (ackermann m (n - 1))
      ackermanns = array ((0, 0),(6, 6)) [((m, n), ackermann' m n) | m <- [0..6], n <- [0..6]]
  in ackermanns ! (m, n)

main :: IO ()
main = do print $ foo ! (6, 6)