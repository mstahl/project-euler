-- The smallest positive integer n for which the numbers n^(2)+1, n^(2)+3,
-- n^(2)+7, n^(2)+9, n^(2)+13, and n^(2)+27 are consecutive primes is 10. The sum
-- of all such integers n below one-million is 1242490.
-- 
-- What is the sum of all such integers n below 150 million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=146

module Main where

import MillerRabin

import Control.Parallel
import Control.Parallel.Strategies

parFilter :: (a -> Bool) -> [a] -> [a]
parFilter _ [] = []
parFilter f (x:xs) =
  let px = f x
      pxs = parFilter f xs
  in par px $ par pxs $ case px of True -> x : pxs
                                   False -> pxs

perfect_square :: Integral t => t -> Bool
perfect_square n = m * m == n where m = floor . sqrt . fromIntegral $ n

test n = [m + 1, m + 3, m + 7, m + 9, m + 13, m + 27] == filter (prime) [(m + 1)..(m + 27)]
         where m = n * n

main :: IO ()
main = do print $ sum $ filter (test) [1..999999]