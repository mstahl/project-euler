-- If p is the perimeter of a right angle triangle with integral length sides,
-- {a,b,c}, there are exactly three solutions for p = 120.
-- 
-- {20,48,52}, {24,45,51}, {30,40,50}
-- 
-- For which value of p ≤ 1000, is the number of solutions maximised?
-- 
-- http://projecteuler.net/index.php?section=problems&id=39

module Main where

import Pythagorean
import Data.List (group, maximumBy)

solutions = map (\l -> (head l, length l)) 
          $ group
          $ map (fst) 
          $ takeWhile ((<=1000).fst) alltriples

main :: IO ()
main = do print $ fst $ maximumBy (\(_, i) (_, j) -> i `compare` j) solutions