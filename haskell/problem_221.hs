-- We shall call a positive integer A an "Alexandrian integer", if there exist
-- integers p, q, r such that:
-- 
-- A = p · q · r
-- 
-- and    
-- 
-- 1   1   1   1
-- - = - + - + -
-- A   p   q   r
-- 
-- For example, 630 is an Alexandrian integer (p = 5, q = −7, r = −18). In
-- fact, 630 is the 6^(th) Alexandrian integer, the first 6 Alexandrian
-- integers being: 6, 42, 120, 156, 420 and 630.
-- 
-- Find the 150000^(th) Alexandrian integer.
-- 
-- http://projecteuler.net/index.php?section=problems&id=221

module Main where

import Misc (divisors)
import Data.List (sort)
import Ratio

-- alexandrians = [p * (p + d) * (p + (((p^2) + 1) `div` d)) | p <- [1..]
--                                                           , d <- divisors $ (p^2) + 1
--                                                           ]

alexandrians = [ a | p <- [1..]
                   , k <- [1..p]
                   , ((p ^ 2) + 1) `mod` k == 0
                   , let q = -(p + k)
                   , let r = -((((p ^ 2) + 1) `div` k) + p)
                   , let a = p * q * r
                   ]

uniq (x1:x2:xs) | x1 == x2 = uniq (x2:xs)
                | otherwise = x1 : uniq (x2:xs)
uniq [x] = [x]
uniq _ = []

main :: IO ()
main = do print $ (sort $ take (150000 * 16) alexandrians) !! 150000
-- main = do print $ take 10 alexandrians
-- main = do mapM_ print $ sort $ take 150000 alexandrians