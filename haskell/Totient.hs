-- (c) max thom stahl <github.com/mstahl>

module Totient where

import ONeillPrimes (primes, prime_factors)
import MillerRabin (prime)
import Data.List
import Data.Array
import Data.Ratio

import Misc (divisors)

totient :: (Integral a, Integral t) => a -> t
totient n | n < 2 = 1
          | otherwise = let inner n = 1 - (1 % n)
                        in ceiling ((fromIntegral n) * (product $ map (inner) (nub $ prime_factors n)))

inverse_totient 0 = []
inverse_totient 1 = [2]
inverse_totient m = 
  let primes1 = reverse [p | p <- map (+1) $ divisors m, prime p]
  in [ q * u | p <- primes1
             , let dmax = ceiling $ logBase (fromIntegral p) $ fromIntegral m
             , d <- [1..dmax]
             , let q = p ^ d
             , let totq = totient q
             , m `mod` totq == 0
             , not $ odd $ m `div` totq
             , m `div` totq > 1
             , u <- inverse_totient (m `div` totq)
             , not $ any (<=p) $ prime_factors u
             ]

-- inverse_totient :: (Integral a, Integral t) => a -> t
-- inverse_totient m = 
--   let memo 0 = []
--       memo 1 = [1, 2]
--       memo m = 
--         let primes1 = reverse [p | p <- takeWhile (<m) primes
--                                  , m `mod` (p - 1) == 0
--                                  ]
--         in [q * u | p <- primes1
--                   , d <- [1..]
--                   , let q = p^d
--                   , q < m
--                   , m `mod` q == 0
--                   , m `mod` (totient q) == 0
--                   , u <- inverse_totient (m `div` q)
--                   , not $ any (<=p) $ prime_factors u
--                   ]
--   in ((map memo [0..]) !!)
