-- A positive integer n is powerful if p^(2) is a divisor of n for every prime
-- factor p in n.
-- 
-- A positive integer n is a perfect power if n can be expressed as a power of
-- another positive integer.
-- 
-- A positive integer n is an Achilles number if n is powerful but not a
-- perfect power. For example, 864 and 1800 are Achilles numbers: 864 =
-- 2^(5)·3^(3) and 1800 = 2^(3)·3^(2)·5^(2).
-- 
-- We shall call a positive integer S a Strong Achilles number if both S and
-- φ(S) are Achilles numbers.^(1)
-- 
-- For example, 864 is a Strong Achilles number: φ(864) = 288 = 2^(5)·3^(2).
-- However, 1800 isn't a Strong Achilles number because: φ(1800) = 480 =
-- 2^(5)·3^(1)·5^(1).
-- 
-- There are 7 Strong Achilles numbers below 10^(4) and 656 below 10^(8).
-- 
-- How many Strong Achilles numbers are there below 10^(18)?
-- 
-- ^(1) φ denotes Euler's totient function.
-- 
-- http://projecteuler.net/index.php?section=problems&id=302

module Main where

import Totient
import ONeillPrimes

powerful :: Integral t => t -> Bool
powerful = all ((>=2) . snd) . prime_factors_exponents

perfect :: Integral t => t -> Bool
perfect n = any (\b -> let x = logBase b $ fromIntegral n 
                       in (round b) ^ (round x) == n) [2..m]
            where m = sqrt $ fromIntegral n

achilles :: Integral t => t -> Bool
achilles n = (powerful n) && (not $ perfect n)

strong_achilles :: Integral t => t -> Bool
strong_achilles n = (achilles n) && (achilles $ totient n)

-- limit = 10 ^ 4
-- limit = 10 ^ 8
limit = 10^6
-- limit = 10 ^ 18

answer = filter (strong_achilles) [2..limit]

main :: IO ()
main = do putStrLn $ "Number of achilles numbers below " ++ (show limit) ++ " = " ++ (show $ length $ answer)
