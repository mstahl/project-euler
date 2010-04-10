-- The rules for writing Roman numerals allow for many ways of writing each
-- number (see FAQ: Roman Numerals). However, there is always a "best" way of
-- writing a particular number.
-- 
-- For example, the following represent all of the legitimate ways of writing
-- the number sixteen:
-- 
-- IIIIIIIIIIIIIIII
-- VIIIIIIIIIII
-- VVIIIIII
-- XIIIIII
-- VVVI
-- XVI
-- 
-- The last example being considered the most efficient, as it uses the least
-- number of numerals.
-- 
-- The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
-- contains one thousand numbers written in valid, but not necessarily minimal,
-- Roman numerals; that is, they are arranged in descending units and obey the
-- subtractive pair rule (see FAQ for the definitive rules for this problem).
-- 
-- Find the number of characters saved by writing each of these in their
-- minimal form.
-- 
-- Note: You can assume that all the Roman numerals in the file contain no more
-- than four consecutive identical units.
-- 
-- http://projecteuler.net/index.php?section=problems&id=89

module Main where

import Control.Monad
import Data.Char (isSpace)

trim :: String -> String
trim = f . f
       where f = reverse . dropWhile isSpace

roman_of_integer :: (Ord t, Num t) => t -> String
roman_of_integer x = 
  let romans = ["m", "cm", "d", "cd", "c", "xc", "l", "xl", "x", "ix", "v", "iv", "i"]
      integers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
      equivs = zip romans integers
      r_of_i es@((r, i):rs) x | x >= i = r ++ (r_of_i es (x - i))
                              | x < i = r_of_i rs x
      r_of_i _ _ = ""
  in r_of_i equivs x

integer_of_roman :: Num t => String -> t
integer_of_roman roman = 
  case roman of
    ('M':rs) -> 1000 + integer_of_roman rs
    ('C':'M':rs) -> 900 + integer_of_roman rs
    ('D':rs) -> 500 + integer_of_roman rs
    ('C':'D':rs) -> 400 + integer_of_roman rs
    ('C':rs) -> 100 + integer_of_roman rs
    ('X':'C':rs) -> 90 + integer_of_roman rs
    ('L':rs) -> 50 + integer_of_roman rs
    ('X':'L':rs) -> 40 + integer_of_roman rs
    ('X':rs) -> 10 + integer_of_roman rs
    ('I':'X':rs) -> 9 + integer_of_roman rs
    ('V':rs) -> 5 + integer_of_roman rs
    ('I':'V':rs) -> 4 + integer_of_roman rs
    ('I':rs) -> 1 + integer_of_roman rs
    _ -> 0

optimize :: String -> String
optimize = roman_of_integer . integer_of_roman

main :: IO ()
main = do numerals <- liftM lines . readFile $ "roman.txt"
          let numerals' = map (trim) numerals
          print $ sum $ map (\n -> (length n) - (length . optimize $ n)) numerals'