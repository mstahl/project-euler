-- It is possible to show that the square root of two can be expressed as an
-- infinite continued fraction.
-- 
-- √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
-- 
-- By expanding this for the first four iterations, we get:
-- 
-- 1 + 1/2 = 3/2 = 1.5
-- 1 + 1/(2 + 1/2) = 7/5 = 1.4
-- 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
-- 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
-- 
-- The next three expansions are 99/70, 239/169, and 577/408, but the eighth
-- expansion, 1393/985, is the first example where the number of digits in the
-- numerator exceeds the number of digits in the denominator.
-- 
-- In the first one-thousand expansions, how many fractions contain a numerator
-- with more digits than denominator?
-- 
-- http://projecteuler.net/index.php?section=problems&id=57

module Main where

import Data.Ratio
import Data.List

digits :: Integral t => t -> [t]
digits 0 = []
digits x = r : (digits q) where (q, r) = divMod x 10

cf_sqrt2 = 1 : repeat 2

cf_of_convergents [] = 0 % 1
cf_of_convergents [x] = x % 1
cf_of_convergents (x:xs) = (x % 1) + 1 / (cf_of_convergents xs)

convergents = map (cf_of_convergents) $ inits cf_sqrt2

count _ [] = 0
count f (x:xs) | f x = 1 + count f xs
               | otherwise = count f xs

n_gt_d r = (length $ digits $ numerator r) > (length $ digits $ denominator r)

main :: IO ()
main = do print $ count (n_gt_d) $ take 1000 convergents