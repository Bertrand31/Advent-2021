module Day1_2
    ( solve
    ) where

import Text.Read (readMaybe)
import Data.Maybe (mapMaybe)

parseDepths :: [String] -> [Int]
parseDepths = mapMaybe readMaybe

countIncreasing :: [(Int, Int)] -> Int
countIncreasing = length . (filter $ uncurry (<))

makePairs :: [a] -> Maybe [(a, a)]
makePairs []       = Nothing
makePairs [x]   = Nothing
makePairs [x, y] = Just [(x, y)]
makePairs (x:y:xs) = fmap ((x, y):) $ makePairs $ y:xs

sumTrios :: [(Int, Int, Int)] -> [Int]
sumTrios = fmap (\(x, y, z) -> x + y + z)

makeTrios :: [a] -> Maybe [(a, a, a)]
makeTrios []         = Nothing
makeTrios [x]        = Nothing
makeTrios [x, y]     = Nothing
makeTrios [x, y, z]  = Just [(x, y, z)]
makeTrios (x:y:z:xs) = fmap ((x, y, z):) $ makeTrios $ y:z:xs

solve :: [String] -> Maybe Int
solve xs = do
  trios <- makeTrios $ parseDepths xs
  pairsOfSums <- makePairs $ sumTrios trios
  return $ countIncreasing pairsOfSums
