-- We shall call a fraction that cannot be cancelled down a resilient fraction.
-- Furthermore we shall define the resilience of a denominator, R(d), to be the
-- ratio of its proper fractions that are resilient; for example, R(12) = 4⁄11.
-- The resilience of a number d > 1 is then
-- 
--   φ(d)
-- -------
--  d - 1
-- 
-- where φ is Euler's totient function.
-- 
-- We further define the coresilience of a number n > 1 as 
-- 
--         n - φ(n)
-- C(n) = ----------
--          n - 1
--                                            1
-- The coresilience of a prime p is C(p) = -------
--                                          p - 1
-- 
-- Find the sum of all composite integers 1 < n ≤ 2×10^(11), for which C(n) is a
-- unit fraction.
-- 
-- Note: the upper limit has been changed recently. Check out that you use the
-- right upper limit.
-- 
-- http://projecteuler.net/index.php?section=problems&id=245

module Main where

import Totient
import Ratio
import ONeillPrimes (composites)

import Control.Parallel
import Control.Parallel.Strategies

resilience :: Integral t => t -> Ratio t
resilience d = (totient d) % (d - 1)

coresilience :: Integral t => t -> Ratio t
coresilience d = (d - (totient d)) % (d - 1)

-- limit = 2 * (10 ^ 11)
limit = 10 ^ 6

test :: Integral t => t -> Bool
test d = (d - 1) `mod` (d - (totient d)) == 0

parFilter :: (a -> Bool) -> [a] -> [a]
parFilter _ [] = []
parFilter f (x:xs) =
  let px = f x
      pxs = parFilter f xs
  in par px $ par pxs $ case px of True -> x : pxs
                                   False -> pxs

main :: IO ()
main = do print $ length $ parFilter (test) 
                $ takeWhile (<limit) $ drop 1 composites
