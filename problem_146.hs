-- The smallest positive integer n for which the numbers n^(2)+1, n^(2)+3,
-- n^(2)+7, n^(2)+9, n^(2)+13, and n^(2)+27 are consecutive primes is 10. The sum
-- of all such integers n below one-million is 1242490.
-- 
-- What is the sum of all such integers n below 150 million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=146

module Main where

import ONeillPrimes

perfect_square n = m * m == n where m = floor . sqrt . fromIntegral $ n

differences (a, b, c, d, e, f) = and [ a - 1 == b - 3
                                     , b - 3 == c - 7
                                     , c - 7 == d - 9
                                     , d - 9 == e - 13
                                     , e - 13 == f - 27
                                     ]

test (a:b:c:d:e:f:fs) | (perfect_square (a - 1)) && (differences (a, b, c, d, e, f)) = a : test (b:c:d:e:f:fs)
                      | otherwise = test (b:c:d:e:f:fs)

-- candidates = [(floor . sqrt . fromIntegral) (n - 1) | n <- test primes]
candidates = map (floor . sqrt . fromIntegral . ((flip (-))1)) $ test primes

main = do print $ take 2 $ candidates