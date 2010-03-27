-- Misc.hs
-- 
-- This is a module for miscellaneous functions that are used frequently but
-- don't really have a good place to live.

module Misc where

import MillerRabin (powMod)

-- Donald Knuth's indexed up arrow function, modulo m
indexed_up_mod m i a b | i == 1 = powMod m a b
                       | b == 0 = 1
                       | otherwise = indexed_up_mod m (i - 1) a 
                                   $ indexed_up_mod m i a (b - 1)