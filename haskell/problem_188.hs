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

import System

-- modularPower code stolen from:
-- http://www.venge.net/graydon/cgi-bin/viewcvs.cgi/src/haskell/numbers.hs?rev=1.2&content-type=text/vnd.viewcvs-markup
-- 
-- this is a really cheap modular exponentiation operator
-- raising b to the e mod n. it runs in O(log(e)log(n)^2) 
modularPower :: Integer -> Integer -> Integer -> Integer
modularPower b 0 n = 1
modularPower b e n = if (e `mod` 2 == 0) 
                     then ((modularPower b (e `div` 2) n) ^ 2) `mod` n
                     else (b * (modularPower  b (e-1) n)) `mod` n

main :: IO ()
main = do let num_digits = 8
              a .^^. 1 = a
              a .^^. (k + 1) = modularPower a (a .^^. k) (10 ^ num_digits)
          print $ 1777 .^^. (num_digits + 1)
