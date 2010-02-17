-- The smallest positive integer n for which the numbers n^(2)+1, n^(2)+3,
-- n^(2)+7, n^(2)+9, n^(2)+13, and n^(2)+27 are consecutive primes is 10. The sum
-- of all such integers n below one-million is 1242490.
-- 
-- What is the sum of all such integers n below 150 million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=146

module Main where

import ONeillPrimes

test :: [Integer] -> Bool
test l = 
  let all_equal l = and $ zipWith (==) l (tail l)
      convert [a,b,c,d,e,f] = [a - 1, b - 3, c - 7, d - 9, e - 13, f - 27]
      perfect_square x = x' * x' == x where x' = floor . sqrt . fromIntegral $ x
      l' = convert l
  in all_equal l' && all (perfect_square) l'

ns :: [Integer]
ns = 
  let ns' (a:b:c:d:e:f:fs) | test [a, b, c, d, e, f] = (floor . sqrt . fromIntegral $ a - 1) : ns' (b:c:d:e:f:fs)
                           | otherwise = ns' (b:c:d:e:f:fs)
  in ns' primes

