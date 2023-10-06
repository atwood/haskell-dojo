module TTT.A1 where

import Data.Char (toUpper)

-- Q#01

_SIZE_ = 3

-- Q#02

_DISPLAY_LOGO_ = True

-- Q#03

-- convertRowIndex = undefined
-- convertRowIndex i =  (fromEnum (toUpper i )) - 65
convertRowIndex =  (-65 +).fromEnum.toUpper

-- Q#04

-- _INVALID_MOVE_ = undefined
_INVALID_MOVE_ = (-1,-1)

-- Q#05

-- _SEP_ = "_|_"
-- _SEP_ = ['_', '|', '_']
_SEP_ = "_|_"


-- Q#06

data Square = X | O | Empty deriving (Read, Show, Eq)
-- Q#07

data GameState = XWon | OWon | Tie | InProgress deriving (Read, Show, Eq)

-- Q#08
type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)

-- Q#09

getFirstPlayer = undefined

getFirstPlayer_ = undefined

-- Q#10

showGameState = undefined

-- Q#11

switchPlayer = undefined

-- Q#12

showSquare = undefined