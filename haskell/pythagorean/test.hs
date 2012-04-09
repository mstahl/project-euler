



module Main where

import qualified PythagoreanIV (alltriples)
import qualified Euclid (alltriples)
import qualified Exhaustive (triples_below)

import Data.List ((\\), sort)

main :: IO ()
main = do let a = Exhaustive.triples_below 1000
              b = takeWhile ((<1000000).fst) Euclid.alltriples
              c = takeWhile ((<1000).fst) PythagoreanIV.alltriples
          -- putStrLn "a: exhaustive list"
          -- mapM_ (print) $ sort a

          -- putStrLn "b: Euclid.triples"
          -- mapM_ (print) b
          
          print $ length b
          -- putStrLn "c: PythagoreanIV.triples"
          -- mapM_ (print) c
          -- 
          -- putStrLn "a \\ b"
          -- print $ (map fst a) \\ (map fst b)
          -- putStrLn "a \\ c"
          -- print $ (map fst a) \\ (map fst c)