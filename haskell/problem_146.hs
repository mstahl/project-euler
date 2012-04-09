-- The smallest positive integer n for which the numbers n^(2)+1, n^(2)+3,
-- n^(2)+7, n^(2)+9, n^(2)+13, and n^(2)+27 are consecutive primes is 10. The sum
-- of all such integers n below one-million is 1242490.
-- 
-- What is the sum of all such integers n below 150 million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=146

module Main where

import MillerRabin (prime)
import ONeillPrimes (primes)

perfect_square :: Integral t => t -> Bool
perfect_square n = m * m == n where m = floor . sqrt . fromIntegral $ n

test n = [m + 1, m + 3, m + 7, m + 9, m + 13, m + 27] == (takeWhile (<=(m + 27)) $ dropWhile (<(m + 1)) primes)
         where m = n * n

ns (a:b:c:d:e:f:xs) = 
  if all (perfect_square) [a - 1, b - 3, c - 7, d - 9, e - 13, f - 27]
  then (floor $ sqrt $ fromIntegral $ a - 1) : ns (b:c:d:e:f:xs)
  else ns (b:c:d:e:f:xs)

main :: IO ()
main = do mapM_ (print) $ take 2 $ ns primes

