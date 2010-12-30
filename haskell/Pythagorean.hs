-- Pythagorean.hs
-- 
-- A module for generating pythagorean triples.

module Pythagorean where

import Misc (mergeAll)
import Data.List (sort)

-- triple u v = let g = u ^ 2
--                  h = 2 * v ^ 2
--                  i = 2 * u * v
--              in (g + i, h + i, g + h + i)

triple m n = (m^2 - n^2 , 2 * m * n , m^2 + n^2)

triples = mergeAll [[(a + b + c, (a, b, c)) | n <- [1..(m-1)]
                                            , let a = m^2 - n^2 
                                            , let b = 2 * m * n 
                                            , let c =  m^2 + n^2
                                            , n `gcd` m == 1
                                            , odd (n + m)
                                            ] | m <- [2..10000]]
alltriples = mergeAll [map (\(p, (a, b, c)) -> (k * p, (k * a, k * b, k * c))) triples | k <- [1..10000]]

triples_with_perimeter_below p = concatMap (\k -> map (\(p, (a, b, c)) -> (k * p, (k * a, k * b, k * c))) triples) [1..10000]