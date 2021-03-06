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

import Data.List (sort)

digits :: Integral t => t -> [t]
digits n
  | n < 10 = [n]
  | otherwise = y:digits x 
  where
    (x, y) = divMod n 10

sum_digits :: Integral t => t -> t
sum_digits = sum . digits

-- a :: Integral t => [t]
a = [x | x <- [10..]
       , let d = digits x
       , let l = logBase d x
       , l == ( fromIntegral $ floor l )
       ]

main :: IO ()
main = do print $ take 10 a
