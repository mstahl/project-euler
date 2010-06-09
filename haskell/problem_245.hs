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
import Data.Ratio
import Data.List (inits,tails)
import MillerRabin (prime)
import Misc (mergeAll)

limit = 2 * (10 ^ 11)

fermats = map (\k -> 2 ^ (2 ^ k) + 1) [0..]

-- consecutive = filter ((>1) . length) . concatMap (tails) . inits
consecutive = mergeAll . map (map product)
                       . map (drop 2)   -- Sublists must be 2 links long
                       . map (inits)
                       . tails

-- candidates = filter (<limit) $ map product $ take 150 $ consecutive fermats
candidates = take 5 $ consecutive fermats

main :: IO ()
main = do print candidates

