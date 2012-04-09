-- Consider the number 50.
-- 50^2 = 2500 = 2^2 * 5^4, so φ(2500) = 2 * 4 * 5^3 = 8 * 5^3 = 2^3 * 5^3. (1)
-- So 2500 is a square and φ(2500) is a cube.
-- 
-- Find the sum of all numbers n, 1 < n < 10^10 such that φ(n^2) is a cube.
-- 
-- (1) φ denotes Euler's totient function.
-- 
-- http://projecteuler.net/index.php?section=problems&id=342

module Main where

import Totient

import Control.Parallel
import Control.Parallel.Strategies
import Misc

mx :: Integral t => t
mx = 10^5

squares :: Integral t => [t]
squares = map (^2) [1..mx]

is_cube :: Integral t => t -> Bool
is_cube n = 
  let cubes = map (^3) [1..]
  in (==n) $ head $ dropWhile (<n) $ cubes

predicate :: Integral t => t -> Bool
predicate = is_cube . totient

main :: IO ()
main = do print $ parMap rwhnf (floor . sqrt . fromIntegral) $ parFilter predicate squares