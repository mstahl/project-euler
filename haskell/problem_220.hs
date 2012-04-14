-- Let D_0 be the two-letter string "Fa". For n ≥ 1, derive D_n from D_(n-1) by the
-- string-rewriting rules:
-- 
-- "a" -> "aRbFR" 
-- "b" -> "LFaLb"
-- 
-- Thus, D_0 = "Fa", D_1 = "FaRbFR", D_2 = "FaRbFRRLFaLbFR", and so on.
-- 
-- These strings can be interpreted as instructions to a computer graphics
-- program, with "F" meaning "draw forward one unit", "L" meaning "turn left 90
-- degrees", "R" meaning "turn right 90 degrees", and "a" and "b" being
-- ignored. The initial position of the computer cursor is (0,0), pointing up
-- towards (0,1).
-- 
-- Then D_n is an exotic drawing known as the Heighway Dragon of order n. For
-- example, D_10 is shown below; counting each "F" as one step, the highlighted
-- spot at (18,16) is the position reached after 500 steps.
-- 
-- What is the position of the cursor after 10^12 steps in D_50?
-- 
-- Give your answer in the form x,y with no spaces.
-- 
-- http://projecteuler.net/problem=220

module Main where

dragon :: Integral t => t -> String
dragon n = 
  let dragon' 0 xs = xs
      dragon' _ "" = ""
      dragon' i (x:xs) | x == 'a'  = (dragon' (i - 1) "aRbFR") ++ (dragon' i xs)
                       | x == 'b'  = (dragon' (i - 1) "LFaLb") ++ (dragon' i xs)
                       | otherwise = x : dragon' i xs
  in dragon' n "Fa"

steps :: Integral t => t -> String -> (Float, Float, Float)
steps n fractal = 
  let steps' 0 (x, y, angle) _ = (x, y, angle)
      steps' n (x, y, angle) (f:fs) | f == 'F'  = steps' (n - 1) (x + (cos angle), y + (sin angle), angle) fs
                                    | f == 'L'  = steps' n (x, y, angle + (pi / 2)) fs
                                    | f == 'R'  = steps' n (x, y, angle - (pi / 2)) fs
                                    | otherwise = steps' n (x, y, angle) fs
  in steps' n (0, 0, pi / 2) fractal

main :: IO ()
main = do let d50 = dragon 50
          print $ steps (10 ^ 12) d50


