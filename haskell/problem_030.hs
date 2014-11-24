-- Surprisingly there are only three numbers that can be written as the sum of
-- fourth powers of their digits:
-- 
--  1634 = 1^(4) + 6^(4) + 3^(4) + 4^(4)
--  8208 = 8^(4) + 2^(4) + 0^(4) + 8^(4)
--  9474 = 9^(4) + 4^(4) + 7^(4) + 4^(4)
-- 
-- As 1 = 1^(4) is not a sum it is not included.
-- 
-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.
-- 
-- Find the sum of all the numbers that can be written as the sum of fifth
-- powers of their digits.
-- 
-- http://projecteuler.net/index.php?section=problems&id=30

module Main where

import Misc (digits)

f = sum . map (^5) . digits

test n = f n == n

valid n = let dl = length $ digits n
          in n < (9 ^ 5) * dl

main :: IO ()
main = do print $ sum $ filter (test) $ takeWhile (valid) [2..]
