{-
Find the smallest x + y + z with integers x  y  z  0 such that x + y, x  y, x + z, x  z, y + z, y  z are all perfect squares.

http://projecteuler.net/index.php?section=problems&id=142
-}

module Main where

squares = map (^2) [1..]

perfect_square n = (round . sqrt . fromIntegral $ n) ^ 2 == n

convert (a, c, d) = 
  let e = a - d
      f = a - c
      b = c - e
      x = (a + b) `div` 2
      y = (e + f) `div` 2
      z = (c - d) `div` 2
  in (x, y, z)

test (a, c, d) = 
  let e = a - d
      f = a - c
      b = c - e
      x = (a + b) `div` 2
      y = (e + f) `div` 2
      z = (c - d) `div` 2
  in (x > y) && (y > z) && (all (perfect_square) [x + y, x - y, x + z, x - z, y + z, y - z])

candidate = head [(a, c, d) | a <- squares
                            , c <- takeWhile (<a) squares
                            , d <- takeWhile (<c) squares
                            , test (a, c, d)
                            ]

main :: IO ()
main = do print $ candidate
          print $ convert candidate
          print $ (\(x, y, z) -> x + y + z) $ convert $ candidate
