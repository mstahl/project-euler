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

increasing :: Ord a => [a] -> Bool
increasing (a:b:xs) | a <= b = increasing (b:xs)
                    | otherwise = False
increasing _ = True

setify :: Integer -> [Int] -> [Integer]
setify i =
  let string = show i
      setify' str (p:ps) = ((read (take p str))::Integer) : setify' (drop p str) ps
      setify' _ _ = []
  in sort . setify' string

unique_partitions_of_9 = partitions 9

sets_from_permutation :: Integer -> [[Integer]]
sets_from_permutation x = map (setify x) unique_partitions_of_9

main :: IO ()
main = do let perms = map (\q -> (read q)::Integer) $ permutationsOf seed
              all_sets_list = filter (all prime) $ nub $ concatMap (sets_from_permutation) perms
          print $ length all_sets_list
