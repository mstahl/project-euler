-- A perfect number is a number for which the sum of its proper divisors is
-- exactly equal to the number. For example, the sum of the proper divisors of
-- 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
-- number.
-- 
-- A number n is called deficient if the sum of its proper divisors is less
-- than n and it is called abundant if this sum exceeds n.
-- 
-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
-- number that can be written as the sum of two abundant numbers is 24. By
-- mathematical analysis, it can be shown that all integers greater than 28123
-- can be written as the sum of two abundant numbers. However, this upper limit
-- cannot be reduced any further by analysis even though it is known that the
-- greatest number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.
-- 
-- Find the sum of all the positive integers which cannot be written as the sum
-- of two abundant numbers.
-- 
-- http://projecteuler.net/index.php?section=problems&id=23

module Main where

import Data.List ((\\))

import Control.Parallel
import Control.Parallel.Strategies

abundant :: Integral t => t -> Bool
abundant n = 
  let s = sum [d | d <- [1..(n `div` 2)], n `mod` d == 0]
  in s > n

abundants :: Integral t => [t]
abundants = filter (abundant) [1..]

abundantables :: Integral t => [t]
abundantables = [c | a <- abundants
                   , b <- takeWhile (<=a) abundants
                   , let c = a + b
                   , c <= 28123
                   ]

main :: IO ()
main = do let all_nums = (28123 * (28123 + 1)) `div` 2
          print $ all_nums - (sum abundantables)