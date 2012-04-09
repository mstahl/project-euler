-- Euclid.hs
-- 
-- Implementation of the Euclidean algorithm for generating
-- pythagorean triples.

module Euclid where

import Misc (mergeAll)
import Data.List (sort)

triple m n = (m^2 - n^2 , 2 * m * n , m^2 + n^2)

primitive_triples = mergeAll [[(a + b + c, (a, b, c)) | n <- [1..(m-1)]
                                                      , let a = m^2 - n^2 
                                                      , let b = 2 * m * n 
                                                      , let c =  m^2 + n^2
                                                      , n `gcd` m == 1
                                                      , odd (n + m)
                                                      ] | m <- [2..10000]]
all_triples = mergeAll [map (\(p, (a, b, c)) -> (k * p, (k * a, k * b, k * c))) primitive_triples | k <- [1..10000]]
