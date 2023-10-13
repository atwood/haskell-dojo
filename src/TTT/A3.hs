module TTT.A3 where

import Data.List (transpose)
import TTT.A1
import TTT.A2
import GHC.IO.Handle (hClose)

-- Q#01

--showInts = undefined
--show lst -- show is already has a list instance
--map show lst
showInts [] = []
showInts (h:t) = show h : (showInts t)

{- t = 0 
r [] = []
r [x] =[x]
r (h:t) = (r t)++[h]
-}
-- _HEADER_ = undefined
_HEADER_ = ' ' : formatLine (showInts _RANGE_)

-- Q#02

-- showSquares = undefined
--showSquares [] = []
--showSquares lst = ' ':(formatLine lst)
showSquares lst = map show lst
-- Q#03

--formatRows = undefined
--formatRows brd = map showSquares brd
formatRows brd = map formatLine (map showSquares brd)

-- Q#04

{- JWA: 2023Oct13 This assignment seems malformed: isColEmpty doesn't need to be recursive, 
        but a function isRowEmpty might well be
-}
--isColEmpty = undefined
isColEmpty row idx = Empty == row !! idx

isRowEmpty (c:[]) = (c==Empty)
isRowEmpty (c:tail) = (c==Empty) && (isRowEmpty tail)

-- Q#05

--dropFirstCol = undefined
dropFirstCol board = map (drop 1) board

--dropLastCol = undefined
dropLastCol board = map (take (fromIntegral (_SIZE_ - 1))) board

-- Q#06

--getDiag1 = undefined

-- JWA 2013-Oct-13 Ooh, remember list comprehensions?
getDiag1 board = [board!! (fromIntegral r) !! (fromIntegral c) | r<-_RANGE_, c<-_RANGE_, r==c]
--getDiag2 = undefined
getDiag2 board = [board!! (fromIntegral r) !! (fromIntegral c) | r<-_RANGE_, c<-(reverse _RANGE_), (_SIZE_ - 1)==r+c]


--getAllLines = undefined
getAllLines board = concat [board
    ,(transpose board)
    ,[getDiag1 board, getDiag2 board]
    ]
-- Q#07

putSquare = undefined

-- Q#08

prependRowIndices = undefined

-- Q#09

isWinningLine_ = undefined

-- Q#10

isValidMove = undefined