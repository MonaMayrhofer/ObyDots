import Data.Char

tobins :: Integral a => a -> [Bool]
tobins 0 = [False]
tobins n = (tobins (div n 2)) ++ [(1 == mod n 2)]

frombins :: [Char] -> Int
frombins [] = 0
frombins (x:xs) = (digitToInt x)*(2^(length xs)) + frombins xs

tobinkk :: (Integral a) => a -> [Bool]
tobinkk n = if n >= 0 
              then tobins n
              else map not $ tobinkk $ negate n - 1


