-- Using all of the digits 1 through 9 and concatenating them freely to form
-- decimal integers, different sets can be formed. Interestingly with the set
-- {2,5,47,89,631}, all of the elements belonging to it are prime.
-- 
-- How many distinct sets containing each of the digits one through nine
-- exactly once contain only prime elements?
-- 
-- http://projecteuler.net/index.php?section=problems&id=118

module Main where

import Control.Parallel
import Control.Parallel.Strategies

import Combinatorics
import Misc
import MillerRabin (prime)
import ONeillPrimes
import Data.List

seed = "123456789"

empty [] = True
empty _ = False

setify str (p:ps) = (take p str) : setify (drop p str) ps
setify _ _ = []

non_unique_partitions = nub . foldl1 (++) . map (permutationsOf) . partitions

sets_of x = let x'    = (show x)::String
                parts = non_unique_partitions $ length seed
            in map (map (\q -> (read q)::Integer)) $ map (setify x') parts

prime_sets_of :: Integer -> [[Integer]]
prime_sets_of = filter (all prime) . sets_of

main :: IO ()
main = do print $ sum
                $ runEval
                $ parBuffer 4096 rseq
                $ map (length . prime_sets_of) 
                $ map (\q -> (read q)::Integer)
                $ permutationsOf seed
