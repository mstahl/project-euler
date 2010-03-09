-- The sequence 1, 1, 1, 3, 5, 9, 17, 31, 57, 105, 193, 355, 653, 1201 ... is
-- defined by T_(1) = T_(2) = T_(3) = 1 and T_(n) = T_(n-1) + T_(n-2) + T_(n-3).
-- 
-- It can be shown that 27 does not divide any terms of this sequence. In fact, 27
-- is the first odd number with this property.
-- 
-- Find the 124^(th) odd number that does not divide any terms of the above
-- sequence.
-- 
-- http://projecteuler.net/index.php?section=problems&id=225

module Main where

tribonaccis :: [Integer]
tribonaccis = 1 : 1 : 1 : zipWith3 (\a b c -> a + b + c) tribonaccis (drop 1 tribonaccis) (drop 2 tribonaccis)