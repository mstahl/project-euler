-- Misc.hs
-- 
-- This is a module for miscellaneous functions that are used frequently but
-- don't really have a good place to live.

module Misc (digits, undigits, powMod, (#), mergeAll, perfect_square) where

import MillerRabin (powMod)

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
mergeAll ([] : zs) = mergeAll zs
mergeAll (xxs@(x:xs) : yys@(y:ys) : zs)
    | x < y = x : mergeAll (xs : yys : zs)
    | otherwise = mergeAll ((xxs # yys) : zs)

-- Divisor functions that aren't the sigma function (found in Sigma.hs)
divisors :: Integral t => t -> [t]
divisors n = [d | d <- [1..(n `div` 2)], n `mod` d == 0] ++ [n]

-- Various numerical functions
perfect_square n = m * m == n where m = round $ sqrt $ fromIntegral n