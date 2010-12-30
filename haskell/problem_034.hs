-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
-- 
-- Find the sum of all numbers which are equal to the sum of the factorial of
-- their digits.
-- 
-- Note: as 1! = 1 and 2! = 2 are not sums they are not included.
-- 
-- http://projecteuler.net/index.php?section=problems&id=34

module Main where

import Misc (digits)

factorial :: Integral t => t -> t
factorial x | x < 2 = 1
            | otherwise = x * (factorial (x - 1))

f :: Integral t => t -> t
f = sum . map (factorial) . digits

test :: Integral t => t -> Bool
test n = f n == n

-- Terminating condition is when n has enough digits so that the factorials of
-- the digits could not possibly sum that high. So when n is greater than the
-- value of f m where m = 999[...]99 with the same number of digits as n.
valid n = let num_digits = length $ digits n
          in n < 362880 * num_digits

main :: IO ()
main = do print $ sum $ filter (test) $ takeWhile (valid) [3..]