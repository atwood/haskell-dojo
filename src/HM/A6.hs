module HM.A6 where

import Data.Char (isAlpha)
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
lengthInRange l = l >= min' && (l <= max') where
    t@(min',max') = _LENGTH_

-- Q#04

invalidMove = undefined

-- Q#05

revealLetters = undefined

-- Q#06

updateChances = undefined

-- Q#07

setSecret = undefined

