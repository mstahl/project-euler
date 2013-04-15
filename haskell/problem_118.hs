-- Using all of the digits 1 through 9 and concatenating them freely to form
-- decimal integers, different sets can be formed. Interestingly with the set
-- {2,5,47,89,631}, all of the elements belonging to it are prime.
-- 
-- How many distinct sets containing each of the digits one through nine exactly
-- once contain only prime elements?
-- 
-- http://projecteuler.net/index.php?section=problems&id=118

module Main where

import Combinatorics
import Misc
import MillerRabin (prime)
import ONeillPrimes
import Data.List

seed = "123456789"

nonincreasing :: Ord a => [a] -> Bool
nonincreasing (a:b:xs)
  | b <= a = nonincreasing (b:xs)
  | otherwise = False
nonincreasing _ = True

chop_up :: String -> [Int] -> [Integer]
chop_up string (x:xs) = (read $ take x string) : chop_up (drop x string) xs
chop_up _ _ = []

main :: IO ()
main = do print $ length
                $ [ q
                  | p <- permutationsOf "123456789"
                  , q <- map (chop_up p) $ partitions 9
                  , nonincreasing q
                  , all prime q
                  ]
