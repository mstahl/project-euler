-- The hyperexponentiation or tetration of a number a by a positive integer
-- b, denoted by a↑↑b or ^(b)a, is recursively defined by:
-- 
-- a↑↑1 = a, a↑↑(k+1) = a^((a↑↑k)).
-- 
-- Thus we have e.g. 3↑↑2 = 3^(3) = 27, hence 3↑↑3 = 3^(27) = 7625597484987
-- and 3↑↑4 is roughly 10^(3.6383346400240996*10^12).
-- 
-- Find the last 8 digits of 1777↑↑1855.
-- 
-- http://projecteuler.net/index.php?section=problems&id=188

module Main where

import Misc (powMod)

num_digits = 8

-- Modular tetration function (this function is fast enough to use to compute
-- the last few hundred or few thousand digits of Graham's number).
(.^^.) :: Integer -> Integer -> Integer
a .^^. 1 = a
a .^^. (k + 1) = powMod (10 ^ num_digits) a (a .^^. k)

main :: IO ()
main = do print $ 1777 .^^. (num_digits + 1)
