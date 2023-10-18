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
cRI char = let 
    tmp1 = toUpper char
    tmp2 = fromEnum tmp1
    tmp3 = tmp2 - 65
    in tmp3
cRI2 char = fromEnum (toUpper char) - 65  
-- Q#04

-- _INVALID_MOVE_ = undefined
_INVALID_MOVE_ = (-1,-1)

-- Q#05

-- _SEP_ = "_|_"
-- _SEP_ = ['_', '|', '_']
_SEP_ = "_|_"


-- Q#06

data Square = X | O | E deriving (Read, Show, Eq)
-- Q#07

data GameState = XWon | OWon | Tie | InProgress deriving (Read, Show, Eq)

-- Q#08
type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)

-- Q#09

-- getFirstPlayer = undefined
getFirstPlayer bool =
    if bool then X
       else O

-- getFirstPlayer_ = undefined
{- forgot to use guards as directed
getFirstPlayer_ True = X
getFirstPlayer_ False = O
-}
getFirstPlayer_ p | p == 'X' = X
getFirstPlayer_ p | p == 'O' = O
getFirstPlayer_ p | True     = E

-- Q#10

-- showGameState = undefined
{- 
showGameState XWon = "X won"
showGameState OWon = "O Won"
showGameState Tie  = "Tie"
showGameState InProgress = "In Progress"
-} 
showGameState state = case state of
    XWon -> "X won"
    OWon -> "O Won"
    Tie  -> "Tie"
    InProgress -> "In Progress"

-- Q#11

-- switchPlayer = undefined
switchPlayer X = O
switchPlayer O = X
switchPlayer E = E

-- Q#12

-- showSquare = undefined
showSquare X = "X"
showSquare O = "O"
showSquare E = "_"