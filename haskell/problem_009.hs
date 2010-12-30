-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- a^(2) + b^(2) = c^(2)
-- 
-- For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).
-- 
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find
-- the product abc.
-- 
-- http://projecteuler.net/index.php?section=problems&id=9

module Main where

-- triples :: Integral t => [t]
-- triples = [a * b * c | c <- [3..1000]
--                      , b <- [2..c]
--                      , a <- [1..b]
--                      , a < b
--                      , b < c
--                      , (a ^ 2) + (b ^ 2) == (c ^ 2)
--                      , a + b + c == 1000
--                      ]
-- 
-- main :: IO ()
-- main = do print $ head triples

import Pythagorean

main :: IO ()
main = do print $ (\(a, b, c) -> a * b * c) $ snd $ head $ filter ((==1000).fst) alltriples