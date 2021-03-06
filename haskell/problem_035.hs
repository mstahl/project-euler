-- The number, 197, is called a circular prime because all rotations of the
-- digits: 197, 971, and 719, are themselves prime.
-- 
-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
-- 71, 73, 79, and 97.
-- 
-- How many circular primes are there below one million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=35

module Main where

import ONeillPrimes (primesToLimit)
import Misc (digits, undigits)
import Data.List (tails)
import MillerRabin (prime)

rotations n = 
  let ds = digits n
      dl = length ds
  in map (undigits) $ take dl $ map (take dl) $ tails $ cycle ds

main :: IO ()
main = do let myprimes = primesToLimit 1000000
              answers = filter (all (prime) . rotations) myprimes
          print $ length $ answers
