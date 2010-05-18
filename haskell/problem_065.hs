-- The square root of 2 can be written as an infinite continued fraction.
-- 
-- [equations]
-- 
-- The infinite continued fraction can be written, √2 = [1;(2)], (2) indicates
-- that 2 repeats ad infinitum. In a similar way, √23 = [4;(1,3,1,8)].
-- 
-- It turns out that the sequence of partial values of continued fractions for
-- square roots provide the best rational approximations. Let us consider the
-- convergents for √2.
-- 
-- [equations]
-- 
-- Hence the sequence of the first ten convergents for √2 are: 1, 3/2, 7/5,
-- 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
-- 
-- What is most surprising is that the important mathematical constant, e = [2;
-- 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
-- 
-- The first ten terms in the sequence of convergents for e are: 2, 3, 8/3,
-- 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
-- 
-- The sum of digits in the numerator of the 10^(th) convergent is 1+4+5+7=17.
-- 
-- Find the sum of digits in the numerator of the 100^(th) convergent of the
-- continued fraction for e.
-- 
-- http://projecteuler.net/index.php?section=problems&id=65

module Main where

import Data.Ratio

-- Continued fraction convergent lifted from 
-- http://www.haskell.org/haskellwiki/Euler_problems/61_to_70#Problem_65
e_cf_convergents = 2 : concat [[1, 2 * i, 1] | i <- [1..]]

cf_of_convergents [x] = x % 1
cf_of_convergents (x:xs) = (x % 1) + 1 / (cf_of_convergents xs)

digits :: Integral t => t -> [t]
digits 0 = []
digits x = r : (digits q) where (q, r) = divMod x 10

main :: IO ()
main = do let n = numerator $ cf_of_convergents $ take 100 e_cf_convergents
          print $ sum $ digits n
