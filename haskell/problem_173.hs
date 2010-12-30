-- We shall define a square lamina to be a square outline with a square "hole"
-- so that the shape possesses vertical and horizontal symmetry. For example,
-- using exactly thirty-two square tiles we can form two different square
-- laminae:
-- 
-- xxxxxx       xxxxxxxxx
-- xxxxxx       x       x
-- xx  xx       x       x
-- xx  xx       x       x
-- xx  xx       x       x
-- xxxxxx       x       x
-- xxxxxx       x       x
--              x       x
--              x       x
--              xxxxxxxxx
-- 
-- With one-hundred tiles, and not necessarily using all of the tiles at one
-- time, it is possible to form forty-one different square laminae.
-- 
-- Using up to one million tiles how many different square laminae can be
-- formed?
-- 
-- http://projecteuler.net/index.php?section=problems&id=173

module Main where

even_factor_pairs :: (Integral t) => t -> [(t, t)]
even_factor_pairs n = [(x, y) | x <- [2,4..n]
                              , let (y, r) = divMod n x
                              , r == 0
                              , even y
                              ]

num_square_laminae = length . even_factor_pairs

main = do print $ sum [num_square_laminae n | n <- [1..100]]