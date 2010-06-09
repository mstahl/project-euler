-- For an integer n ≥ 4, we define the lower prime square root of n, denoted by
-- lps(n), as the largest prime ≤ √n and the upper prime square root of n, ups(n),
-- as the smallest prime ≥ √n.
-- 
-- So, for example, lps(4) = 2 = ups(4), lps(1000) = 31, ups(1000) = 37. Let us
-- call an integer n ≥ 4 semidivisible, if one of lps(n) and ups(n) divides n, but
-- not both.
-- 
-- The sum of the semidivisible numbers not exceeding 15 is 30, the numbers are 8,
-- 10 and 12. 15 is not semidivisible because it is a multiple of both lps(15) = 3
-- and ups(15) = 5. As a further example, the sum of the 92 semidivisible numbers
-- up to 1000 is 34825.
-- 
-- What is the sum of all semidivisible numbers not exceeding 999966663333 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=234

module Main where

import ONeillPrimes
import Data.List (sort,(\\),union,intersect)
import Misc (perfect_square)

-- Brute-force methods, for testing.
ups :: Integral t => t -> t
ups n = head $ dropWhile (\p -> p ^ 2 < n) primes

lps :: Integral t => t -> t
lps n = last $ takeWhile (\p -> p ^ 2 <= n) primes

xor :: Bool -> Bool -> Bool
xor p q = (p && (not q)) || ((not p) && q)

semidivisibles = filter (\n -> let u = ups n
                                   l = lps n
                               in (u /= l) && ((n `mod` u == 0) `xor` (n `mod` l == 0)))
                        [4..]

-- Clever methods, for solving.
count (p:q:xs) = 
  let n = p ^ 2
      m = q ^ 2
      ps = [x | x <- tail [n,(n+p)..m], x `mod` q /= 0, not $ perfect_square x]
      qs = [y | y <- tail [m,(m-q)..n], y `mod` p /= 0, not $ perfect_square y]
  in (sort $ (ps `union` qs) \\ (ps `intersect` qs)) ++ (count (q:xs))
count _ = []

main :: IO ()
-- main = do print $ sort $ count $ takeWhile (<=37) primes
main = do let limit = 999966663333
              plimit = ups limit
              semis = takeWhile (<=limit)
                    $ count 
                    $ takeWhile (<=plimit) primes
          -- mapM_ print semis
          putStrLn $ "There are " ++ (show $ length semis) 
                                  ++ " semidivisibles below "
                                  ++ (show limit)
          putStrLn $ "Their sum is " ++ (show $ sum semis)




