-- Misc.hs
-- 
-- This is a module for miscellaneous functions that are used frequently but
-- don't really have a good place to live.

module Misc where

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