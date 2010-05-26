-- The primes 3, 7, 109, and 673, are quite remarkable. By taking any two
-- primes and concatenating them in any order the result will always be prime.
-- For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of
-- these four primes, 792, represents the lowest sum for a set of four primes
-- with this property.
-- 
-- Find the lowest sum for a set of five primes for which any two primes
-- concatenate to produce another prime.
-- 
-- http://projecteuler.net/index.php?section=problems&id=60

module Main where

import ONeillPrimes
import Misc (digits, undigits)

is_prime :: Integral t => t -> Bool
is_prime n = elem n $ takeWhile (<=n) primes

(#) :: Integral t => t -> t -> t
a # b = undigits $ (digits a) ++ (digits b)

concats :: Integral t => [t] -> [t]
concats [] = []
concats (x:xs) = (map (x#) xs) ++ (map (#x) xs) ++ (concats xs)

main :: IO ()
main = do let sets4 = [[a, b, c, d] | a <- primes
                                    , b <- takeWhile (<a) primes
                                    , c <- takeWhile (<b) primes
                                    , d <- takeWhile (<c) primes
                                    , all (is_prime) $ concats [a, b, c, d]
                                    ]
          print $ head $ sets4