-- We shall say that an n-digit number is pandigital if it makes use of all the
-- digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
-- also prime.
-- 
-- What is the largest n-digit pandigital prime that exists?
-- 
-- http://projecteuler.net/index.php?section=problems&id=41

module Main where

import Misc (digits)
import Data.List ((\\))
import ONeillPrimes (primesToLimit)

pandigital n = ds \\ [1..(length ds)] == [] where ds = digits n

main :: IO ()
-- main = do let q = filter (pandigital) $ primesToLimit 987654321
--           mapM_ print q
--           print $ last $ q
main = do print $ length $ primesToLimit 987654321