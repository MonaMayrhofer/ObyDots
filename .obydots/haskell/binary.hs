tobin :: Int -> [Int]
tobin 0 = 0
tobin n = (mod n 2):(tobin (floor (n / 2)))
