-- Module for computing the infinite sorted list of squarefree integers.

module Squarefrees (squarefree, (#), mergeAll) where

import Data.List (mapAccumL)
import ONeillPrimes (primes)

-- sieve (x:xs) = x : sieve (filter (\n -> n `mod` x /= 0) xs)
-- primes = sieve [2..]

-- merge two nondecreasing lists.
(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

-- merge an infinite list of lists, assuming that each list
-- is nondecreasing and the lists occur in order of their first
-- element.
mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll ([] : zs) = mergeAll zs
mergeAll (xxs@(x:xs) : yys@(y:ys) : zs)
    | x < y = x : mergeAll (xs : yys : zs)
    | otherwise = mergeAll ((xxs # yys) : zs)

-- given a list of all squarefree numbers with factors up to
-- but not including p, produce (a,b), where a is all squarefree
-- numbers with factors up to p, and b only includes those which
-- are multiples of p.
primeStep xs p = (xs # pxs, pxs)
  where pxs = map (p*) xs

-- the nth element of primeLists is a sorted list of squarefree
-- numbers with factors up to p_n, which are all multiples of p_n.
-- Therefore every squarefree number occurs exactly once in (concat
-- primeLists), and the lists in primeLists are sorted by first element.
primeLists = snd $ mapAccumL primeStep [1] primes

-- to get a sorted list of squarefree numbers, just merge primeLists.
squarefree = 1 : mergeAll primeLists