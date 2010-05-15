-- Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
-- containing over five-thousand first names, begin by sorting it into
-- alphabetical order. Then working out the alphabetical value for each name,
-- multiply this value by its alphabetical position in the list to obtain a
-- name score.
-- 
-- For example, when the list is sorted into alphabetical order, COLIN, which
-- is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
-- would obtain a score of 938 × 53 = 49714.
-- 
-- What is the total of all the name scores in the file?
-- 
-- http://projecteuler.net/index.php?section=problems&id=22

module Main where

import Data.Array
import Data.List (sort)
import Control.Monad

score :: (Enum e, Num e) => [Char] -> e
score (c:cs) = let scores = array ('A', 'Z') $ zip ['A'..'Z'] [1..26]
               in (scores ! c) + (score cs)
score [] = 0

main :: IO ()
main = do names <- liftM lines . readFile $ "names.txt"
          let names' = sort names
          print $ sum $ zipWith (*) [1..] $ map (score) names'
