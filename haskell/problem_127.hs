-- The radical of n, rad(n), is the product of distinct prime factors of n. For
-- example, 504 = 2^(3) × 3^(2) × 7, so rad(504) = 2 × 3 × 7 = 42.
-- 
-- We shall define the triplet of positive integers (a, b, c) to be an abc-hit if:
-- 
--    1. GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
--    2. a < b
--    3. a + b = c
--    4. rad(abc) < c
-- 
-- For example, (5, 27, 32) is an abc-hit, because:
-- 
--    1. GCD(5, 27) = GCD(5, 32) = GCD(27, 32) = 1
--    2. 5 < 27
--    3. 5 + 27 = 32
--    4. rad(4320) = 30 < 32
-- 
-- It turns out that abc-hits are quite rare and there are only thirty-one
-- abc-hits for c < 1000, with ∑c = 12523.
-- 
-- Find ∑c for c < 120000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=127

module Main where

import ONeillPrimes
import Data.List (nub, group, sort)

import Data.Array.IArray
import Data.Array.Unboxed

snub :: Eq t => [t] -> [t]
snub (x1:x2:xs) | x1 == x2 = snub (x2:xs)
                | x1 /= x2 = x1:snub (x2:xs)
snub [x1] = [x1]
snub _ = []

limit :: Integral t => t
limit = 120000 - 1

-- Memoized radical function
rad :: (Integral t) => t -> t
rad = product . nub . prime_factors

rads :: UArray Int Int
rads = listArray (1, limit) $ map (rad) [1..limit]

-- inverse_rads :: [(Int, Int)]
inverse_rads = sort $ map (\(a, b) -> (b, a)) $ assocs rads

-- hits :: (Integral t, Ix t) => [(t, t, t)]
hits = [c | (rc, c) <- inverse_rads
          , 2 * rc < c
          , (ra, a) <- takeWhile (\(a, _)->(c > 2 * rc * a)) inverse_rads
          , a < c `div` 2
          , gcd ra rc == 1
          , ra * rads ! (c - a) < c `div` rc
          ]
-- Above section borrowed from http://www.haskell.org/haskellwiki/Euler_problems/121_to_130#Problem_127


main :: IO ()
main = do mapM_ (print) hits
          putStrLn $ "Num hits: " ++ (show $ length hits)
          putStrLn $ "Sum:      " ++ (show $ sum hits)


