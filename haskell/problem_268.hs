-- It can be verified that there are 23 positive integers less than 1000 that
-- are divisible by at least four distinct primes less than 100.
-- 
-- Find how many positive integers less than 10^16 are divisible by at least
-- four distinct primes less than 100.
-- 
-- http://projecteuler.net/index.php?section=problems&id=268

module Main where

import ONeillPrimes
-- import Combinatorics
import Data.List as L
import Data.Set as S
import Misc (choices, mergeAll)

limit = 10^7

-- Bases is the list of all products of groups of four primes less than 100. 
-- Iterating over these, multiplying by each positive integer until the product
-- is over the limit, will produce all the integers less than the limit which
-- are divisible by *at least* 4 primes below 100. 
bases = sort $ L.map (L.foldl1 (*)) $ choices 4 $ primesToLimit 100

-- For each of the base 
-- matches = takeWhile (<limit) $ mergeAll [iterate (+b) b | b <- bases]
-- matches = S.fromList $ L.concat [L.map (*b) [1..(limit `div` b)] | b <- bases]
-- matches = sort $ L.concat [L.map (*b) [1..(limit `div` b)] | b <- bases]
matches = S.unions [S.fromList $ L.map (*b) [1..(limit `div` b)] | b <- bases]

main :: IO ()
main = do -- mapM_ (\x -> putStrLn $ (show x) ++ ": " ++ (show $ prime_factors x)) matches
          -- print $ length matches
          print $ S.size matches
