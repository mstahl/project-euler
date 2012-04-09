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

modulus = 14 ^ 8
-- modulus = 14 ^ 7

(.^^.) :: Integer -> Integer -> Integer
a .^^. 1 = a `mod` modulus
a .^^. (k + 1) = powMod modulus a (a .^^. k)

-- A(4, 4) = 2^^7 - 3
-- A(5, 5) = 2^^^8 - 3 = 2^^2^^2^^2^^2^^2^^2^^2 - 3

iterarrow n a b | n == 1 = powMod modulus a b
                | b == 0 = 1
                | otherwise = iterarrow (n - 1) a (iterarrow n a (b - 1))

ackermann :: Integer -> Integer -> Integer
ackermann 0 0 = 1
ackermann 1 1 = 3
ackermann 2 2 = 7
ackermann m n = (iterarrow (m - 2) 2 (n + 3)) - 3

-- Primitive recursive version:
iter f 0       = f 1
iter f (n + 1) = f $ iter f n
ack 0       = ((flip mod) modulus) . succ 
ack (m + 1) = iter (ack m)

-- Some more functions
-- tower :: Integral t => t -> [Integer]
tower n = iterate (\m -> powMod modulus n m) n
-- tower n = iterate (\m -> n .^^. m) n

main = do mapM_ (print) $ tower 2

--main :: IO ()
--main = do print $ ack 1
{-main = do print $ ackermann 0 0
          print $ ackermann 1 1
          print $ ackermann 2 2
          print $ ackermann 3 3
          print $ ackermann 4 4
          print $ ackermann 5 5
          print $ ackermann 6 6-}
