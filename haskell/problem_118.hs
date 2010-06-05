-- Using all of the digits 1 through 9 and concatenating them freely to form
-- decimal integers, different sets can be formed. Interestingly with the set
-- {2,5,47,89,631}, all of the elements belonging to it are prime.
-- 
-- How many distinct sets containing each of the digits one through nine
-- exactly once contain only prime elements?
-- 
-- http://projecteuler.net/index.php?section=problems&id=118

module Main where

import ONeillPrimes
import Data.List ((\\))
import Misc (digits)

set ds (p:ps) | length (digits p) > length ds = 0
              | ds == [] = 1
              | 0 `elem` (digits p) = set ds ps
              | ((digits p) \\ ds) /= [] = set ds ps
              | otherwise = (set (ds \\ (digits p)) ps) + (set ds ps)

main :: IO ()
main = do print $ set [1..9] primes