-- Pythagorean IV
-- 
-- From http://en.wikipedia.org/wiki/Formulae_for_generating_Pythagorean_triples#IV.

module PythagoreanIV where

import Misc (mergeAll)

triple u v = 
  let g = u ^ 2
      h = 2 * (v ^ 2)
      i = 2 * u * v
  in (g + i, h + i, g + h + i)

triples = [(a + b + c, (a, b, c)) | u <- [1,3..]
                                  , v <- [1..]
                                  , u `gcd` v == 1
                                  , let (a, b, c) = triple u v
                                  ]

alltriples = mergeAll [map (\(p, (a, b, c)) -> (k * p, (k * a, k * b, k * c))) triples | k <- [1..10000]]
