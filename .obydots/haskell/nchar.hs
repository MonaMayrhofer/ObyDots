data NChar x = Chr (x) | NChr (x) deriving (Show)

tryconcletters :: (Eq a) => NChar a -> NChar a -> [NChar a]
tryconcletters (Chr a) (Chr b) = [Chr a, Chr b]
tryconcletters (Chr a) (NChr b)
  | a == b = []
  | otherwise = [Chr a, NChr b]
tryconcletters (NChr a) (Chr b)
  | a == b = []
  | otherwise = [NChr a, Chr b]

class NCharString a where
  conc :: [NChar a] -> [NChar a] -> [NChar a]
  pt :: [a] -> [NChar a]
  nt :: [a] -> [NChar a]

instance NCharString Char where
  conc [] bs = bs
  conc as [] = as
  conc as (b : bs)
    | null middle = conc (init as) bs
    | otherwise = init as ++ middle ++ bs
    where
      middle = tryconcletters (last as) b

  pt = map Chr
  nt = map NChr

o :: (NCharString a) => [NChar a] -> [NChar a] -> [NChar a]
a `o` b = conc a b
