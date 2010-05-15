-- Let d(n) be defined as the sum of proper divisors of n (numbers less than n
-- which divide evenly into n).
-- 
-- If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
-- each of a and b are called amicable numbers.
-- 
-- For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
-- 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
-- 71 and 142; so d(284) = 220.
-- 
-- Evaluate the sum of all the amicable numbers under 10000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=21

module Main where

import qualified Data.Map as Map

sum_divisors :: Integral t => t -> t
sum_divisors n = sum [d | d <- [1..(n `div` 2)], n `mod` d == 0]

amicable :: Integral t => t -> Bool
amicable n = m1 /= n && n == m2
             where m1 = sum_divisors n
                   m2 = sum_divisors m1

main :: IO ()
main = do print $ sum $ filter (amicable) [1..10000]