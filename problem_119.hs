-- The number 512 is interesting because it is equal to the sum of its digits
-- raised to some power: 5 + 1 + 2 = 8, and 8^(3) = 512. Another example of a
-- number with this property is 614656 = 28^(4).
-- 
-- We shall define a_(n) to be the nth term of this sequence and insist that a
-- number must contain at least two digits to have a sum.
-- 
-- You are given that a_(2) = 512 and a_(10) = 614656.
-- 
-- Find a_(30).
-- 
-- http://projecteuler.net/index.php?section=problems&id=119

module Main where

sum_digits :: Integral t => t -> t
sum_digits 0 = 0
sum_digits n = (n `mod` 10) + sum_digits (n `div` 10)

test :: Integral t => t -> Bool
test n = if s == 1 then False else (floor m) == (ceiling m)
         where s = sum_digits n
               m = (log . fromIntegral $ n) / (log . fromIntegral $ s)

a_sequence = filter (test) [11..]