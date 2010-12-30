-- It turns out that 12 cm is the smallest length of wire that can be bent to form
-- an integer sided right angle triangle in exactly one way, but there are many
-- more examples.
-- 
-- 12 cm: (3,4,5)
-- 24 cm: (6,8,10)
-- 30 cm: (5,12,13)
-- 36 cm: (9,12,15)
-- 40 cm: (8,15,17)
-- 48 cm: (12,16,20)
-- 
-- In contrast, some lengths of wire, like 20 cm, cannot be bent to form an
-- integer sided right angle triangle, and other lengths allow more than one
-- solution to be found; for example, using 120 cm it is possible to form exactly
-- three different integer sided right angle triangles.
-- 
-- 120 cm: (30,40,50), (20,48,52), (24,45,51)
-- 
-- Given that L is the length of the wire, for how many values of L <= 1,500,000 can
-- exactly one integer sided right angle triangle be formed?

module Main where

import Pythagorean
import Data.List (group, maximumBy)

solutions = filter ((==1).snd) $ map (\x:xs -> (x, length (x:xs)))
                               $ group
                               $ takeWhile (<=1500000)
                               $ map (fst) alltriples


main :: IO ()
main = do mapM_ (print) solutions
          print $ length solutions


-- A much more clever solution from http://www.haskell.org/haskellwiki/Euler_problems/71_to_80#Problem_75
-- 
-- import Data.Array
--  
-- triangs :: [Int]
-- triangs = [p | n <- [2..1000],
--                m <- [1..n-1],
--                gcd m n == 1,
--                odd (m+n),
--                let p = 2 * (n^2 + m*n),
--                p <= 2*10^6]
--  
-- problem_75 :: Int
-- problem_75 = length
--        $ filter (\(_, c) -> c == 1)
--        $ assocs
--        $ (\ns -> accumArray (+) 0 (1, 2*10^6) [(n, 1) | n <- ns, inRange (1, 2*10^6) n])
--        $ concatMap (\n -> takeWhile (<=2*10^6) [n,2*n..]) triangs
-- 
-- main = do print problem_75