-- A positive integer, n, is divided by d and the quotient and remainder are q
-- and r respectively. In addition d, q, and r are consecutive positive integer
-- terms in a geometric sequence, but not necessarily in that order.
-- 
-- For example, 58 divided by 6 has quotient 9 and remainder 4. It can also be
-- seen that 4, 6, 9 are consecutive terms in a geometric sequence (common
-- ratio 3/2).
-- 
-- We will call such numbers, n, progressive.
-- 
-- Some progressive numbers, such as 9 and 10404 = 102^(2), happen to also be
-- perfect squares.
-- 
-- The sum of all progressive perfect squares below one hundred thousand is
-- 124657.
-- 
-- Find the sum of all progressive perfect squares below one trillion
-- (10^(12)).
-- 
-- http://projecteuler.net/index.php?section=problems&id=141

module Main where

import Data.Ratio
import Data.List

is_geometric :: Integral t => t -> t -> Bool
is_geometric n d = let (q, r) = divMod n d
                       [d', q', r'] = sort [d, q, r]
                   in d' % q' == q' % r'

is_progressive :: Integral t => t -> Bool
is_progressive n = any (is_geometric n) [2..(floor . sqrt . fromIntegral $ n)]

main :: IO ()
main = do let squares = map (^2) [1..(10^6)]
              progressives = filter (is_progressive) squares
          mapM_ (print) progressives
          print $ sum progressives