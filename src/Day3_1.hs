module Day3_1
    ( solve
    ) where

import Data.Bits (complement)
import Data.List (transpose)
import Text.Read (readMaybe)

data Bit = One | Zero
  deriving Eq

charToBit :: Char -> Maybe Bit
charToBit '0' = Just Zero
charToBit '1' = Just One
charToBit _   = Nothing

stringToBits :: String -> (Maybe [Bit])
stringToBits = traverse charToBit

bitsToInt :: [Bit] -> Int
bitsToInt xs =
  let withIndexes = zip (reverse xs) [0..]
   in sum $ fmap (\(x, i) -> if (x == One) then 1 * (2 ^ i) else 0) withIndexes

solve :: [String] -> Maybe Int
solve xs = do
  bitRows <- traverse stringToBits xs
  let digits = length $ head bitRows
      kek = transpose bitRows
      onesPerColumn = fmap (length . filter (One ==)) kek
      newBits = fmap (\x -> if (x > (digits `div` 2)) then One else Zero) onesPerColumn
      foo = bitsToInt newBits
      bar = complement foo
  return $ foo * bar
