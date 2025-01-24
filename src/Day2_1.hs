module Day2_1
    ( solve
    ) where

import Text.Read (readMaybe)

data Command = Forward Int | Up Int | Down Int

accumulateCommands' :: Int -> Int -> [Command] -> Int
accumulateCommands' forward depth [] = forward * depth
accumulateCommands' forward depth (x:xs) =
  case x of (Forward a) -> accumulateCommands' (forward + a) depth xs
            (Up a)      -> accumulateCommands' forward (depth - a) xs
            (Down a)    -> accumulateCommands' forward (depth + a) xs

accumulateCommands :: [Command] -> Int
accumulateCommands = accumulateCommands' 0 0

parseCommand :: String -> Maybe Command
parseCommand str =
  case (words str) of "forward":stepsStr:[] -> fmap Forward $ readMaybe stepsStr
                      "up":stepsStr:[]      -> fmap Up $ readMaybe stepsStr
                      "down":stepsStr:[]    -> fmap Down $ readMaybe stepsStr
                      _                     -> Nothing


solve :: [String] -> Maybe Int
solve xs = do
  commands <- traverse parseCommand xs
  return $ accumulateCommands commands
