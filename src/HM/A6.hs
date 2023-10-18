module HM.A6 where

import Data.Char (isAlpha)
import Data.List
import HM.Provided

-- Q#01
type Chances = Int
type Guess   = String
type Move    = Char
type Secret  = String
type Dictionary = [String]

-- Q#02
data GameException =
      InvalidChars
    | InvalidLength
    | NotInDict
    | InvalidMove
    | RepeatMove
    | GameOver
    deriving (Eq, Read, Show)

-- Q#03
--_LENGTH_ = (4,6)
lengthInRange s = l >= min' && (l <= max') where
    t@(min',max') = _LENGTH_
    l = length s

-- Q#04

invalidMove c = not (isAlpha c)

-- Q#05

revealLetters m s g | not (elem m s) = g
revealLetters m s g = let 
    is = elemIndices m s
    f m g is = foldl (reveal s) g is
    in f m g is

reveal s g idx = let
        (pre,post) = splitAt idx g
        post'      = tail post 
        new        = [s!!idx]
        in concat [pre,new,post']


-- Q#06

updateChances = undefined

-- Q#07

setSecret = undefined

