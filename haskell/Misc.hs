-- Misc.hs
-- 
-- This is a module for miscellaneous functions that are used frequently but
-- don't really have a good place to live.

module Misc (parFilter, digits, undigits, powMod, (#), mergeAll, perfect_square, factorial, divisors, choices) where

import MillerRabin (powMod)
import Control.Parallel
import Control.Parallel.Strategies
import Data.Maybe
import Data.List (nub, sort, delete)

parFilter :: (a -> Bool) -> [a] -> [a]
parFilter f = catMaybes . runEval 
                        . parBuffer 4096 rpar
                        . map (\n -> if f n
                                     then Just n
                                     else Nothing)

digits :: Integral t => t -> [t]
digits n
  | n < 10 = [n]
  | otherwise = (digits x) ++ [y]
  where
    (x, y) = divMod n 10

undigits :: Integral t => [t] -> t
undigits = 
  let undigits' [] = 0
      undigits' (x:xs) = (undigits' xs) * 10 + x
  in undigits' . reverse

-- Donald Knuth's indexed up arrow function, modulo m
indexed_up_mod m i a b | i == 1 = powMod m a b
                       | b == 0 = 1
                       | otherwise = indexed_up_mod m (i - 1) a 
                                   $ indexed_up_mod m i a (b - 1)

-- Merge two nondecreasing lists.
(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll = foldl1 (#)

-- Divisor functions that aren't the sigma function (found in Sigma.hs)
divisors :: Integral t => t -> [t]
divisors n = [d | d <- [1..(n `div` 2)], n `mod` d == 0] ++ [n]

-- Various numerical functions
perfect_square n = m * m == n where m = round $ sqrt $ fromIntegral n
factorial n | n < 2 = 1
            | otherwise = n * (factorial (n - 1))

permutationsOf [] = [[]]
permutationsOf xs = [x:xs' | x <- xs, xs' <- permutationsOf (delete x xs)]

-- Choose elements from a list. All members of the list must be unique, 
-- and the list must not be infinite.
-- choices :: (Num a, Eq b) => a -> [b] -> [[b]]
choices 0 _ = [[]]
choices _ [] = [[]]
-- choices n xs = [x:xs' | x <- xs, xs' <- choices (n - 1) (delete x xs)]
choices n xs = filter (\l -> length l == n) [x:xs' | x <- xs, xs' <- choices (n - 1) (dropWhile (<=x) xs)]


