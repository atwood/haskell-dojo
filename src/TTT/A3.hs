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

{-  JWA: 2023Oct15 Oh, I see, recurse
    JWA: 2023Oct13 This assignment seems malformed: isColEmpty doesn't need to be recursive, 
        but a function isRowEmpty might well be
-}
--isColEmpty = undefined
--isColEmpty row idx = Empty == row !! idx
isColEmpty [] idx = True
isColEmpty row idx = E == head row && (isColEmpty (tail row) (idx-1))
--isColEmpty 
isRowEmpty (c:[]) = (c==E)
isRowEmpty (c:tail) = (c==E) && (isRowEmpty tail)

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

--putSquare = undefined
putSquare :: Player -> Board -> Move -> Board
putSquare pl [] mv = []
putSquare pl brd (r,c) = let
   (rowsPre,rowsRest) = splitAt r brd
   row = head rowsRest
   rowsLast = tail rowsRest
   (colsPre,colsRest) = splitAt c row
   colsLast = tail colsRest
   newRow = concat [colsPre,[pl],colsLast]
   in concat [rowsPre,[newRow],rowsLast]

t = [[0,1,2],[3,4,5],[6,7,8]]   
-- Q#08

--prependRowIndices = undefined
prependRowIndices lst = map f (zip idxs lst) where
    idxs = ['A','B'..]
    f (idx,str) = idx:str

-- Q#09

--isWinningLine_ = undefined

isWinningLine p [] = False
isWinningLine p l = all (==p) l

-- Q#10

--isValidMove = undefined
isValidMove brd mv | not$isMoveInBounds mv = False
isValidMove brd (r,c) = let 
    (pre,post) = splitAt (fromIntegral r) brd
    row = head post
    in isColEmpty row (fromIntegral c)
