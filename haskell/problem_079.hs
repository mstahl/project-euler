-- A common security method used for online banking is to ask the user for
-- three random characters from a passcode. For example, if the passcode was
-- 531278, they may asked for the 2nd, 3rd, and 5th characters; the expected
-- reply would be: 317.
-- 
-- The text file, keylog.txt (http://projecteuler.net/project/keylog.txt),
-- contains fifty successful login attempts.
-- 
-- Given that the three characters are always asked for in order, analyse the
-- file so as to determine the shortest possible secret passcode of unknown
-- length.
-- 
-- http://projecteuler.net/index.php?section=problems&id=79

module Main where

import qualified Data.Set as Set
import qualified Data.HashTable as Ht
import Data.List (nub, sortBy)

attempts :: [[Int]]
attempts = [[3, 1, 9], [6, 8, 0], [1, 8, 0], [6, 9, 0], [1, 2, 9], [6, 2, 0],
            [7, 6, 2], [6, 8, 9], [7, 6, 2], [3, 1, 8], [3, 6, 8], [7, 1, 0],
            [7, 2, 0], [7, 1, 0], [6, 2, 9], [1, 6, 8], [1, 6, 0], [6, 8, 9],
            [7, 1, 6], [7, 3, 1], [7, 3, 6], [7, 2, 9], [3, 1, 6], [7, 2, 9],
            [7, 2, 9], [7, 1, 0], [7, 6, 9], [2, 9, 0], [7, 1, 9], [6, 8, 0],
            [3, 1, 8], [3, 8, 9], [1, 6, 2], [2, 8, 9], [1, 6, 2], [7, 1, 8],
            [7, 2, 9], [3, 1, 9], [7, 9, 0], [6, 8, 0], [8, 9, 0], [3, 6, 2],
            [3, 1, 9], [7, 6, 0], [3, 1, 6], [7, 2, 9], [3, 8, 0], [3, 1, 9],
            [7, 2, 8], [7, 1, 6]]

main :: IO ()
main = do let alphabet = Set.toList $ Set.fromList $ concat attempts
          ht <- Ht.new (==) (Ht.hashInt)
          mapM_ (\a -> Ht.insert ht a [a]) alphabet
          mapM_ (\[a0, a1, a2] -> do l_a1 <- Ht.lookup ht a1
                                     l_a2 <- Ht.lookup ht a2
                                     case l_a1 of
                                       Just x -> Ht.update ht a1 $ a0 : x
                                     case l_a2 of
                                       Just x -> Ht.update ht a2 $ a0 : a1 : x
                ) attempts
          befores <- mapM (\a -> do la_a <- Ht.lookup ht a
                                    case la_a of
                                      Just x -> return x
                                      Nothing -> return [a]) alphabet
          mapM_ (putStr . show) $ map (last)
                                $ sortBy (\a b -> (length a) `compare` (length b))
                                $ map (nub) befores
