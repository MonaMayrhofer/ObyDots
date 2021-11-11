import Data.Char

parsebool :: Char -> Bool
parsebool '1' = True
parsebool '0' = False
parsebool _ = error "Not a vaid binary representation"

frombinstr :: [Char] -> Int
frombinstr = frombin . map parsebool

-- Transforms a [Bool] into a binary number
frombinsimple :: [Bool] -> Int
frombinsimple = foldl (\acc x -> acc * 2 + (if x then 1 else 0)) 0

-- Transforms a simple binary number (no negatives) to complement.
tobinsimple :: Integral a => a -> [Bool]
tobinsimple 0 = [False]
tobinsimple n = tobinsimple (div n 2) ++ [1 == mod n 2]

-- Transforms a [Bool] in 2-complement to a number
frombin :: [Bool] -> Int
frombin (sign : xs)
  | sign = pred . negate . frombinsimple $ map not xs
  | otherwise = frombinsimple xs

-- Transforms a number to 2-complement.
tobin :: (Integral a) => a -> [Bool]
tobin n
  | n >= 0 = tobinsimple n
  | otherwise = map not . tobin . pred . negate $ n
