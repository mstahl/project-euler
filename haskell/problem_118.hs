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

import Combinatorics (permutations)

set ds (p:ps) | length (digits p) > length ds = 0                       -- No more than 9 digits
              | ds == [] = 1                                            -- If we've used up all 9, we have a set
              | 0 `elem` (digits p) = set ds ps                         -- No zeros allowed
              | ((digits p) \\ ds) /= [] = set ds ps
              | otherwise = (set (ds \\ (digits p)) ps) + (set ds ps)
set _ [] = 0

main :: IO ()
-- main = do print $ set [1..3] $ take 5 primes
-- main = do print $ length $ permutations 9
main = do print $ length $ primesToLimit 98765432