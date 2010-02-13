-- (c) max thom stahl <github.com/mstahl>

module Totient where

import ONeillPrimes
import Data.List
import Data.Array
import Ratio

totient :: (Integral a, Integral t) => a -> t
totient n | n < 2 = 1
          | otherwise = let inner n = 1 - (1 % n)
                        in ceiling ((fromIntegral n) * (product $ map (inner) (nub $ prime_factors n)))
