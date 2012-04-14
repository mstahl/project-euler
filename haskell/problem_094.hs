-- It is easily proved that no equilateral triangle exists with integral length
-- sides and integral area. However, the almost equilateral triangle 5-5-6 has
-- an area of 12 square units.
-- 
-- We shall define an almost equilateral triangle to be a triangle for which
-- two sides are equal and the third differs by no more than one unit.
-- 
-- Find the sum of the perimeters of all almost equilateral triangles with
-- integral side lengths and area and whose perimeters do not exceed one
-- billion (1,000,000,000).
-- 
-- http://projecteuler.net/index.php?section=problems&id=94

module Main where

is_int n = f == c where f = floor n
                        c = ceiling n

limit = 10 ** 9

almosts = [floor p | a <- [1..(limit/3)]
                   , b <- [a - 1, a + 1]
                   , let p = 2 * a + b
                   , let area = 0.5 * b * (sqrt $ (a ** 2) - 0.25 * (b ** 2))
                   , is_int area
                   ]

main :: IO ()
main = do mapM_ print almosts
          putStrLn "----------"
          print $ sum almosts

