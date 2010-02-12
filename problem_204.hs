-- A Hamming number is a positive number which has no prime
-- factor larger than 5. So the first few Hamming numbers
-- are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15. There are 1105
-- Hamming numbers not exceeding 10^8.
-- 
-- We will call a positive number a generalised Hamming
-- number of type n, if it has no prime factor larger than
-- n. Hence the Hamming numbers are the generalised Hamming
-- numbers of type 5.
-- 
-- How many generalised Hamming numbers of type 100 are
-- there which don't exceed 10^9?

module Main where

import Data.List

import ONeillPrimes

-- This is my implementation of Dijkstra's algorithm for
-- generating Hamming numbers, from his notes linked to
-- from the wikipedia article. It's nearly verbatim the
-- same as his handwritten notes. Implementing a more
-- succinct way of doing the merges on x would be very
-- nice here, so that a more general function (with an
-- argument for type).
(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll ([] : zs) = mergeAll zs
mergeAll (xxs@(x:xs) : yys@(y:ys) : zs)
    | x < y = x : mergeAll (xs : yys : zs)
    | otherwise = mergeAll ((xxs # yys) : zs)

times :: (Integral a) => a -> [a] -> [a]
times n (a:b) = n * a : times n b

hammings :: Integral t => [t]
-- hammings = 1 : foldl1 (#) [times r hammings | r <- takeWhile (<100) primes]
hammings = 1 : foldl1 (#) [times r hammings | r <- takeWhile (<100) primes]

main :: IO ()
main = do print $ length $ takeWhile (<=1000000000) hammings

