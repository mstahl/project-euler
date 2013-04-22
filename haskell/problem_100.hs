{-
 - If a box contains twenty-one coloured discs, composed of fifteen blue discs
 - and six red discs, and two discs were taken at random, it can be seen that
 - the probability of taking two blue discs, P(BB) = (15/21)(14/20) = 1/2.
 - 
 - The next such arrangement, for which there is exactly 50% chance of taking
 - two blue discs at random, is a box containing eighty-five blue discs and
 - thirty-five red discs.
 - 
 - By finding the first arrangement to contain over 10^12 = 1,000,000,000,000
 - discs in total, determine the number of blue discs that the box would
 - contain.
 -
 - http://projecteuler.net/problem=100
 -}

module Main where

n_min :: Integer
n_min = 10 ^ 12

{-
 - Using the methods at http://www.alpertron.com.ar/QUAD.HTM, I found the below
 - recurrence relationship. I kept the recurrence as variables instead of
 - simplifying to make it easier to find again.
 -}
solutions :: Integral t => [(t, t)]
solutions = iterate recurrence (15, 21)
            where
            a = 2
            b = 0
            c = -1
            d = -2
            e = 1
            f = 0
            r = 3
            s = 2
            recurrence (x, y) =
              let x' = (r^2 - a*c*s^2)*x - c*s*(2*r + b*s)*y - c*d*s^2 - e*r*s
                  y' = a*s*(2*r + b*s)*x + (r^2 + 2*b*r*s + (b^2 - a*c)*s^2)*y + d*s*(r + b*s) - a*e*s^2
              in (x', y')

main :: IO ()
main = do let next = fst $ head $ dropWhile ((<n_min) . snd) solutions
          print next
