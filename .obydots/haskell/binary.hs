import Data.Char

tobins :: Integral a => a -> [a]
tobins 0 = [0]
tobins n = (tobins (div n 2)) ++ [(mod n 2)]

frombins :: [Char] -> Int
frombins [] = 0
frombins (x:xs) = (digitToInt x)*(2^(length xs)) + frombins xs

tobinkk :: (Num a, Integral b) => a -> [b]
tobinkk n = if n >= 0 
              then tobins (toInt n)
              else tobinkk (-n)


