{-
 - Problem 157
 -
 - Problem description goes here.
 -}

module Main where

import Misc (divisors)

-- It's useful to pre-cache the factors of 10^9, since this list will also
-- include all the factors of 10^8, which contains all the factors of 10^7, and
-- so on through 10 and 1.
divisors_of_a_billion :: (Integral t) => [t]
divisors_of_a_billion = [
  1, 2, 4, 5, 8, 10, 16, 20, 25, 32, 40, 50, 64, 80, 100, 125, 128, 160, 200,
  250, 256, 320, 400, 500, 512, 625, 640, 800, 1000, 1250, 1280, 1600, 2000,
  2500, 2560, 3125, 3200, 4000, 5000, 6250, 6400, 8000, 10000, 12500, 12800,
  15625, 16000, 20000, 25000, 31250, 32000, 40000, 50000, 62500, 64000, 78125,
  80000, 100000, 125000, 156250, 160000, 200000, 250000, 312500, 320000, 390625,
  400000, 500000, 625000, 781250, 800000, 1000000, 1250000, 1562500, 1600000,
  1953125, 2000000, 2500000, 3125000, 3906250, 4000000, 5000000, 6250000,
  7812500, 8000000, 10000000, 12500000, 15625000, 20000000, 25000000, 31250000,
  40000000, 50000000, 62500000, 100000000, 125000000, 200000000, 250000000,
  500000000, 1000000000
  ]

-- Because we cached all the possible divisors, we only need to filter down
-- that cached list to just those that divide n. If we're given a billion as
-- input, we can just instantly return a reference to our cached list of all
-- the factors, saving some effort.
divisors_of :: Integral t => t -> [t]
divisors_of 9 = divisors_of_a_billion
divisors_of n = filter (\d -> (10^n) `mod` d == 0)
              $ takeWhile (<=n) divisors_of_a_billion

solutions :: Integral t => t -> [(t, t, t)]
solutions n = [(a, b, p) | a <- divisors_of n
                         , b <- divisors_of n
                         , let p = ((10^n) * (a + b)) `div` (a * b)
                         ]

main :: IO ()
