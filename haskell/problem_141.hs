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
import Data.Maybe

import Control.Parallel
import Control.Parallel.Strategies

perfect_square :: Integral t => t -> Bool
perfect_square n = m * m == n
                   where m = floor $ sqrt $ fromIntegral n

is_progressive :: Integral t => t -> Bool
is_progressive n =
  let is_progressive' n d = r % d == d % q
                            where (q, r) = n `divMod` d
  in any (is_progressive' n) [1..(floor $ sqrt $ fromIntegral n)]

-- sqrt_of_limit = 10^6
sqrt_of_limit = 10^4

parFilter :: (a -> Bool) -> [a] -> [a]
parFilter f = catMaybes
            . runEval
            . parBuffer 2048 rpar
            . map (\n -> if f n
                         then Just n
                         else Nothing)

main :: IO ()
main = do let ns = [ n
                   | a <- [2..9999]
                   , b <- [1..(a - 1)]
                   , k <- [1..((10^12) `div` (b^2))]
                   , a `gcd` b == 1
                   , let n = k^2 * a^3 * b + k * b^2
                   , n < 10^12
                   -- , perfect_square n
                   ]
              ns' = runEval $ parList rpar ns
          mapM_ (print) ns
          putStrLn "+------------------+"
          print $ sum ns
