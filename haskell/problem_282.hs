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
import MillerRabin (powMod)

modulus = 14 ^ 8

-- Extra-naïve, double-recursive function. Blows out the stack like nobody's business.
-- 
-- ackermann :: Int -> Int -> Int
-- ackermann m n = 
--   let ackermann' m n | m == 0 = (n + 1) `mod` modulus
--                      | m > 0 && n == 0 = (ackermann (m - 1) 1) `mod` modulus
--                      | m > 0 && n > 0 = (ackermann (m - 1) (ackermann m (n - 1))) `mod` modulus
--       ackermanns :: UArray (Int, Int) Int
--       ackermanns = array ((0, 0),(6, 6)) [((m, n), ackermann' m n) | m <- [0..6], n <- [0..6]]
--   in ackermanns ! (m, n)
-------------------------------------------------------------------------------
-- Using the isomorphism on the wikipedia page: http://en.wikipedia.org/wiki/Ackermann_function
-- 
ackermann :: Int -> Int -> Int
ackermann 0 = succ
ackermann m = ((iterate (\n -> (ackermann (m - 1) n) `mod` modulus) 1) !!).(+1)

-------------------------------------------------------------------------------
-- Using Knuth's indexed up-arrow notation
-- 
-- indexed_up_mod m i a b | i == 1 = powMod m a b
--                        | b == 0 = 1
--                        | otherwise = indexed_up_mod m (i - 1) a 
--                                    $ indexed_up_mod m i a (b - 1)
-- ackermann m n = (indexed_up_mod modulus (m - 2) 2 (n + 3)) - 3


main :: IO ()
main = do print $ ackermann 1 0   -- => 2
          print $ ackermann 2 2   -- => 7
          print $ ackermann 3 4   -- => 125
          print $ ackermann 4 4   -- => ?