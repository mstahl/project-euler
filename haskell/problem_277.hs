-- A modified Collatz sequence of integers is obtained from a starting value
-- a_(1) in the following way:
-- 
-- a_(n+1) = a_(n)/3 if a_(n) is divisible by 3. We shall denote this as a
-- large downward step, "D".
-- 
-- a_(n+1) = (4a_(n) + 2)/3 if a_(n) divided by 3 gives a remainder of 1. We
-- shall denote this as an upward step, "U".
-- 
-- a_(n+1) = (2a_(n) - 1)/3 if a_(n) divided by 3 gives a remainder of 2. We
-- shall denote this as a small downward step, "d".
-- 
-- The sequence terminates when some a_(n) = 1.
-- 
-- Given any integer, we can list out the sequence of steps. For instance if
-- a_(1)=231, then the sequence {a_(n)}={231,77,51,17,11,7,10,14,9,3,1}
-- corresponds to the steps "DdDddUUdDD".
-- 
-- Of course, there are other sequences that begin with that same sequence
-- "DdDddUUdDD....". For instance, if a_(1)=1004064, then the sequence is
-- DdDddUUdDDDdUDUUUdDdUUDDDUdDD. In fact, 1004064 is the smallest possible
-- a_(1) > 10^(6) that begins with the sequence DdDddUUdDD.
-- 
-- What is the smallest a_(1) > 10^(15) that begins with the sequence
-- "UDDDUdddDDUDDddDdDddDDUDDdUUDd"?
-- 
-- http://projecteuler.net/index.php?section=problems&id=277

module Main where

import Data.List (isPrefixOf)

a 1 = ""
a n = case n `mod` 3 of
        0 -> 'D':(a (n `div` 3))
        1 -> 'U':(a ((4 * n + 2) `div` 3))
        2 -> 'd':(a ((2 * n - 1) `div` 3))

main :: IO ()
main = do print $ head $ [n | n <- [(10^15 + 1)..]
                            , let q = take 30 $ a n
                            , "UDDDUdddDDUDDddDdDddDD" `isPrefixOf` q
                            -- , "DdDddUUdDD" `isPrefixOf` q
                            ]
