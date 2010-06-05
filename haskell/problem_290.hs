

module Main where

import Misc (digits)

test n = (sum $ digits n) == (sum $ digits $ 137 * n)
-- test n = (sum $ digits n) `mod` 9 == 0

limit = (10 ^ 6) - 1

main :: IO ()
--main = do print $ length $ filter (test) [3,6..limit]
--main = do let lst = filter test [9,18..limit]
--          -- mapM_ print $ lst
--          putStrLn $ ("matches: ") ++ (show $ length lst)

main = do let some_9s = filter (test) [0,9..limit]
          print $ length some_9s
