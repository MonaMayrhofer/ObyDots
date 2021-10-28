tobin :: Integral a => a -> [a]
tobin 0 = [0]
tobin n = (tobin (div n 2)) ++ [(mod n 2)]

