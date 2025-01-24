module Day2_2
    ( solve
    ) where

import Text.Read (readMaybe)

data Command = Forward Int | Up Int | Down Int

accumulateCommands' :: Int -> Int -> Int -> [Command] -> Int
accumulateCommands' aim forward depth [] = forward * depth
accumulateCommands' aim forward depth (x:xs) =
  case x of (Forward a) -> accumulateCommands' aim (forward + a) (depth + aim * a) xs
            (Up a)      -> accumulateCommands' (aim - a) forward depth xs
            (Down a)    -> accumulateCommands' (aim + a) forward depth xs

accumulateCommands :: [Command] -> Int
accumulateCommands = accumulateCommands' 0 0 0

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
