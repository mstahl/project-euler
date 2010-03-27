-- There are some prime values, p, for which there exists a positive integer, n,
-- such that the expression n^(3) + n^(2)p is a perfect cube.
-- 
-- For example, when p = 19, 8^(3) + 8^(2)×19 = 12^(3).
-- 
-- What is perhaps most surprising is that for each prime with this property the
-- value of n is unique, and there are only four such primes below one-hundred.
-- 
-- How many primes below one million have this remarkable property?
-- 
-- http://projecteuler.net/index.php?section=problems&id=131

module Main where

import ONeillPrimes

elt :: Eq a => a -> [a] -> Bool
elt x (y:ys) | x == y = True
             | otherwise = elt x ys
elt _ _ = False

-- myprime :: Int -> Bool
myprime n = elt n $ takeWhile (<=n) primes

limit = 10 ^ 6

cubes = map (^3) [1..]

candidates = filter (myprime)
           $ takeWhile (<limit)
           $ zipWith (-) (tail cubes) cubes

main :: IO ()
main = do print $ length candidates

-- Had a little help from reading this solution:
-- http://github.com/gadial/project-euler