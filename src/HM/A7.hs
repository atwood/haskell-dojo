module HM.A7 where

import Data.Char (isAlpha, toLower, toUpper)
import HM.A6
import HM.Provided
import System.Directory (doesFileExist)
import Data.List (intersperse, sort)

-- Q#01
data Game = G {s::String, g::String, l::[Char], c::Int} deriving (Eq, Read ) --, Show)

-- Q#02

repeatedMove m g = elem m (l g)

-- Q#03

--makeGame s = G {s=map toUpper s, g=replicate (length s) '_', l="", c=_CHANCES_}
makeGame s = G {s=map toUpper s, g=map (\c->const '_' 0) s, l="", c=_CHANCES_}

-- Q#04

updateGame m gm = 
  let
    oldS = s gm
    oldG = g gm
    oldL = l gm
    oldC = c gm
    newG = revealLetters (toUpper m) oldS oldG
    newL = oldL++[toUpper m]
    newC = if (newG == oldG) then oldC - 1 else oldC
  in G {s = oldS, g = newG, l = newL, c = newC }

-- Q#05
instance Show Game where
   show gm = 
     let
       a = 4
       guess = g gm
       lstMoves = l gm
       chnces   = c gm
     in showGameHelper guess lstMoves chnces

showGameHelper :: String -> [Char] -> Int -> String
showGameHelper game moves chances =
  unlines
    [ _STARS_,
      "\tSecret Word:\t" ++ intersperse ' ' game ++ "\n",
      "\tGuessed:\t" ++ intersperse ' ' (sort moves) ++ "\n",
      "\tChances:\t" ++ show chances,
      _STARS_
    ]

-- Q#06


-- Q#07

toMaybe False a = Nothing
toMaybe True  a = Just a


-- Q#08

validateSecret f exc secret = case (f exc secret) of
  True -> Left secret
  False -> Right (show exc)
  where f InvalidChars  = hasValidChars 
        --f NotInDict     = isInDict _DICT_ 
        f InvalidLength = isValidLength
        
-- Q#09

hasValidChars :: String -> Bool
hasValidChars sec = all (isAlpha) sec

isValidLength :: String -> Bool
isValidLength sec = lengthInRange sec

isInDict :: [String] -> String -> Bool
isInDict dict sec =  elem (map toLower sec) dict

-- Q#10

validateNoDict sec = 
  if not (hasValidChars sec) then Right InvalidChars
     else if not (isValidLength sec) then Right InvalidLength
     else Left sec

validateWithDict dict sec = case (validateNoDict sec) of
  Right exc -> Right exc
  Left s    -> if not (isInDict dict s) then Right NotInDict
                 else Left s
  

-- Q#11

processTurn mv gm = let
   g' = updateGame mv gm
   --in case (g g')==(g gm) of
   in g'
   
-- Either Game GameException

pT mv gm | invalidMove mv = Right InvalidChars
pT mv gm | repeatedMove mv gm = Right RepeatMove
pT mv gm = let
   g' = updateGame mv gm
   in case (g g')==(g gm) of
      True -> Left $ g' {c=updateChances mv (s gm) (c gm)}
      False -> Left $ g'  
--1) validChar
--2) char already chosen
--3) play and chances