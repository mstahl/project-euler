module Modulo where

import Data.List

modAdd :: (Integral t) => t -> t -> t -> t
modAdd m a b = (a + b) `mod` m

modMul :: (Integral t) => t -> t -> t -> t
modMul m a b = (a * b) `mod` m

modSum :: (Integral t) => t -> [t] -> t
modSum m = foldl' (modAdd m) 0

modProduct :: (Integral t) => t -> [t] -> t
modProduct m = foldl' (modMul m) 1

modFactorial :: (Integral t) => t -> t -> t
modFactorial m n = modProduct m [2..n]
