-- Exhaustive.hs
-- 
-- This module is mostly for testing. It generates all the pythagorean
-- triples below a certain perimeter limit by brute force. Do not use 
-- this for anything real.

module Exhaustive where

triples_below mx = 
  [(a + b + c, (a, b, c)) | b <- [1..mx]
                          , a <- [1..b]
                          , let c = round $ sqrt
                                          $ fromIntegral
                                          $ (a*a) + (b*b)
                          , a + b + c < mx
                          , a^2 + b^2 == c^2
                          ]

-- (c) 2010 max thom stahl