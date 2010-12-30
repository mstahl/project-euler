-- A positive integer n is called squarefree, if no
-- square of a prime divides n, thus 1, 2, 3, 5, 6,
-- 7, 10, 11 are squarefree, but not 4, 8, 9, 12.
-- 
-- How many squarefree numbers are there below 2^50?
-- 
-- http://projecteuler.net/index.php?section=problems&id=193

module Main where

import Data.List
import ONeillPrimes
import Squarefrees

limit = 2 ^ 30
limit2 = floor . sqrt . fromIntegral $ limit

mysquarefrees = takeWhile (<limit2) squarefree


main :: IO ()
main = do print $ length mysquarefrees