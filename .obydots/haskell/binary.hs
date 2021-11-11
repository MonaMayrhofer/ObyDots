import Data.Char

tobins :: Integral a => a -> [Bool]
tobins 0 = [False]
tobins n = tobins (div n 2) ++ [1 == mod n 2]

parsebool :: Char -> Bool
parsebool '1' = True
parsebool '0' = False
parsebool _ = error "Not a vaid binary representation"

frombinstr :: [Char] -> Int
frombinstr = frombinkk . map parsebool

frombins :: [Bool] -> Int
frombins [] = 0
frombins (x : xs) = (if x then 1 else 0) * (2 ^ length xs) + frombins xs

frombinkk :: [Bool] -> Int
frombinkk (sign : xs)
  | sign = pred . negate . frombins $ map not xs
  | otherwise = frombins xs

tobinkk :: (Integral a) => a -> [Bool]
tobinkk n =
  if n >= 0
    then tobins n
    else map not $ tobinkk $ negate n - 1
