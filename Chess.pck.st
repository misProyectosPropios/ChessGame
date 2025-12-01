'From Cuis7.2 [latest update: #6897] on 1 December 2025 at 9:26:30 am'!
'Description '!
!provides: 'Chess' 1 18!
SystemOrganization addCategory: #chess!


!classDefinition: #ChessTest category: #chess!
TestCase subclass: #ChessTest
	instanceVariableNames: 'chess whitePiecesPosition blackPiecesPosition pieces turns'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessTest class' category: #chess!
ChessTest class
	instanceVariableNames: ''!

!classDefinition: #ChessGame category: #chess!
Object subclass: #ChessGame
	instanceVariableNames: 'pieces turnWhite turnScheduler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessGame class' category: #chess!
ChessGame class
	instanceVariableNames: ''!

!classDefinition: #ColorPiece category: #chess!
Object subclass: #ColorPiece
	instanceVariableNames: 'piece'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ColorPiece class' category: #chess!
ColorPiece class
	instanceVariableNames: ''!

!classDefinition: #BlackPiece category: #chess!
ColorPiece subclass: #BlackPiece
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'BlackPiece class' category: #chess!
BlackPiece class
	instanceVariableNames: ''!

!classDefinition: #WhitePiece category: #chess!
ColorPiece subclass: #WhitePiece
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'WhitePiece class' category: #chess!
WhitePiece class
	instanceVariableNames: ''!

!classDefinition: #Pieces category: #chess!
Object subclass: #Pieces
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Pieces class' category: #chess!
Pieces class
	instanceVariableNames: ''!

!classDefinition: #Bishop category: #chess!
Pieces subclass: #Bishop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Bishop class' category: #chess!
Bishop class
	instanceVariableNames: ''!

!classDefinition: #King category: #chess!
Pieces subclass: #King
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'King class' category: #chess!
King class
	instanceVariableNames: ''!

!classDefinition: #Knight category: #chess!
Pieces subclass: #Knight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Knight class' category: #chess!
Knight class
	instanceVariableNames: ''!

!classDefinition: #Pawn category: #chess!
Pieces subclass: #Pawn
	instanceVariableNames: 'direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Pawn class' category: #chess!
Pawn class
	instanceVariableNames: ''!

!classDefinition: #InitialPawn category: #chess!
Pawn subclass: #InitialPawn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'InitialPawn class' category: #chess!
InitialPawn class
	instanceVariableNames: ''!

!classDefinition: #NonInitialPawn category: #chess!
Pawn subclass: #NonInitialPawn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'NonInitialPawn class' category: #chess!
NonInitialPawn class
	instanceVariableNames: ''!

!classDefinition: #Queen category: #chess!
Pieces subclass: #Queen
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Queen class' category: #chess!
Queen class
	instanceVariableNames: ''!

!classDefinition: #Rook category: #chess!
Pieces subclass: #Rook
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Rook class' category: #chess!
Rook class
	instanceVariableNames: ''!


!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:42:24'!
blackKing
	^ BlackPiece of: (King at: 5@8)! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 11:16:58'!
blackKnight
	^ Set with: (BlackPiece of: (Knight at: 2@8)) with: (BlackPiece of: (Knight at: 7@8))! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/30/2025 20:33:51'!
blackPawn
	|pawns|
	pawns := Set new.
	1 to: 8 do: [:x | pawns add: (BlackPiece of: (InitialPawn at: x@7 withDirection: -1))].
	^ pawns
	! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:44:06'!
blackPiecesPosition

	blackPiecesPosition := Set new.
	blackPiecesPosition addAll: self blackPawn .
	blackPiecesPosition addAll: self blackKnight .
	blackPiecesPosition addAll: self whiteBishop .
	blackPiecesPosition addAll: self whiteRook .
	blackPiecesPosition addAll: self whiteQueen .
	blackPiecesPosition add: self whiteKing .
	^ blackPiecesPosition.! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:42:02'!
blackQueen
	^ Set with: (BlackPiece of: (Queen at: 4@8))! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 10:32:50'!
chessWithTwoMovesPerPlayer
	self manyMovesPerPlayer .
	self standarPositionPieces .
	chess := ChessGame withPawnsOn: pieces withTurnsScheduler: self.
	! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 09:43:56'!
standarPositionPieces
	pieces := Set new.
	pieces addAll: self whitePiecesPosition .
	pieces addAll: self blackPiecesPosition .
	! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 12:27:30'!
whiteBishop
	^ Set with: (WhitePiece of: (Bishop at: 3@1)) with: (WhitePiece of: (Bishop at: 6@1))! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:42:40'!
whiteKing
	^ WhitePiece of: (King at: 5@1)! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 11:17:26'!
whiteKnight
	^ Set with: (WhitePiece of: (Knight at: 2@1)) with: (WhitePiece of: (Knight at: 7@1))! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/30/2025 20:33:58'!
whitePawn
	|pawns|
	pawns := Set new.
	1 to: 8 do: [:x | pawns add: (WhitePiece of: (InitialPawn at: x@2 withDirection: 1))].
	^ pawns
	! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:43:32'!
whitePiecesPosition
	
	whitePiecesPosition := Set new.
	whitePiecesPosition addAll: self whitePawn .
	whitePiecesPosition addAll: self whiteKnight .
	whitePiecesPosition addAll: self whiteBishop .
	whitePiecesPosition addAll: self whiteRook .
	whitePiecesPosition addAll: self whiteQueen .
	whitePiecesPosition add: self whiteKing .
	^ whitePiecesPosition.! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 12/1/2025 00:42:54'!
whiteQueen
	^ Set with: (WhitePiece of: (Queen at: 4@1))! !

!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 13:06:25'!
whiteRook
	^ Set with: (WhitePiece of: (Rook at: 1@1)) with: (WhitePiece of: (Rook at: 8@1))! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 10:29:21'!
setUp
	self standardTurn.
	
	self standarPositionPieces .
	chess := ChessGame withPawnsOn: pieces withTurnsScheduler: self.
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:24:26'!
test01_movePieceFromE2ToE3HasPawnOnTheNewPosition

	self assert: (chess hasPawnOn: 5@2).
	chess movePieceFrom: 5@2 to: 5@3.
	self assert: (chess hasPawnOn: 5@3).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:22:00'!
test02_pawnMoveFromE2ToE3IsNotInE2

	chess movePieceFrom: 5@2 to: 5@3.
	self deny: (chess hasPawnOn: 5@2)! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 08:50:44'!
test03_tryMovingPawnToSideRaisesAnError
	
	self should: [chess movePieceFrom: 5@2 to: 6@2.] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 6@2)).
			self assert: (chess hasPawnOn: 5@2).
		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 08:50:14'!
test04_tryMovingPawnMoreThan2CellsAboveRaisesAnError
	
	self should: [chess movePieceFrom: 5@2 to: 5@5.] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 5@5)).
			self assert: (chess hasPawnOn: 5@2).
			self deny: (chess hasPawnOn: 5@5).
		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 08:33:02'!
test05_moveKnigthFrom2x1To3x3HasKnightInTheNewPosition
	
	self assert: (chess hasKnightOn: 2@1).
	chess movePieceFrom: 2@1 to: 3@3.
	self assert: (chess hasKnightOn: 3@3).
	self deny: (chess hasKnightOn: 2@1).
! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 09:04:30'!
test06_moveKnightVerticallyRaisesAnError
	
	self assert: (chess hasKnightOn: 7@1).
	
	self should: [chess movePieceFrom: 7@1 to: 7@3.]
		raise:  Error - MessageNotUnderstood 
		withExceptionDo: [:error |
			
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 7@3)).
			self assert: (chess hasKnightOn: 7@1).
			self deny: (chess hasKnightOn: 7@3).
		] .
! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 09:02:37'!
test07_firstMoveItsWhiteTurnNextTurnItsBlackTurn
	self assert: (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	chess movePieceFrom: 5@2 to: 5@3.
	self deny:  (chess isWhiteTurn).
	self assert: (chess isBlackTurn).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 09:53:19'!
test08_changeTurnMovesAgainToThePawnCorrectly
	self assert: (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	chess movePieceFrom: 5@2 to: 5@3.
	chess movePieceFrom: 5@7 to: 5@6.
	
	self assert:  (chess hasPawnOn: 5@6).
	self deny: (chess  hasPawnOn: 5@7).
	
	self assert:  (chess isWhiteTurn).
	self deny: (chess isBlackTurn).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 10:35:20'!
test09_modifyTurns2TurnsPerPlayer
	self chessWithTwoMovesPerPlayer.
	
	self assert: (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	
	chess movePieceFrom: 3@2 to: 3@3.
	
	self assert:  (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	
	chess movePieceFrom: 3@3 to: 3@4.
	
	self assert: (chess hasPawnOn: 3@4).
	
	self deny:  (chess isWhiteTurn).
	self assert: (chess isBlackTurn).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 11:16:11'!
test10_movePawnBackwardsIsNotAllowed
	self chessWithTwoMovesPerPlayer.
	
	self assert: (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	
	chess movePieceFrom: 3@2 to: 3@3.
	
	self assert:  (chess isWhiteTurn).
	self deny: (chess isBlackTurn).
	
	chess movePieceFrom: 3@3 to: 3@4.
	
	self assert: (chess hasPawnOn: 3@4).
	
	self deny:  (chess isWhiteTurn).
	self assert: (chess isBlackTurn).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 12:15:01'!
test11_pawnMoveBackwardsRaisesError
	self chessWithTwoMovesPerPlayer.
	chess movePieceFrom: 3@2 to: 3@3.
	
	self assert:  (chess isWhiteTurn).
	
	self should: [chess movePieceFrom: 3@3 to: 3@2.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 3@2)).
			self assert: (chess hasPawnOn: 3@3).
			self deny: (chess hasPawnOn: 3@2).
		]. 
	
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 12:46:37'!
test12_moveBishopDiagonallyMovesItToThePosition
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasBishopOn: 3@1).
	
	chess movePieceFrom: 2@2 to: 2@3.
	chess movePieceFrom: 3@1 to: 1@3.

	self assert: (chess hasBishopOn: 1@3).	
	self deny: (chess hasBishopOn: 3@1).	
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 12:54:06'!
test13_bishopTriesToMoveNotDiagonallyRaisesAnError
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasBishopOn: 3@1).
	
	chess movePieceFrom: 3@2 to: 3@3.
	
	self should: [chess movePieceFrom: 3@1 to: 3@3.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | 
			self assert: error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 3@3).
			self assert: (chess hasBishopOn: 3@1).	
			self deny: (chess hasBishopOn: 3@3).	
	
		].	


	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 13:05:20'!
test14_rookMovesVerticallyThenItsOnTheExpectedPlace
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasRookOn: 8@1).
	
	chess movePieceFrom: 8@2 to: 8@3.
	chess movePieceFrom: 8@1 to: 8@2.

	self assert: (chess hasRookOn: 8@2).	
	self deny: (chess hasRookOn: 8@1).	
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 13:24:28'!
test15_rookTriesToMoveNotVerticallyNeitherHorizontallyGeneratesError
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasRookOn: 8@1).
	
	chess movePieceFrom: 7@2 to: 7@3.
	
	self should: [chess movePieceFrom: 8@1 to: 7@2.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | 
			self assert: error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 7@2).
			self assert: (chess hasRookOn: 8@1).	
			self deny: (chess hasRookOn: 7@2).	
	
		].	


	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 13:27:22'!
test16_tryToMoveAPieceThatDoesntHaveAnyPieceRaisesAnError
	
	self should: [chess movePieceFrom: 6@3 to: 6@4.] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoHayPiezaEnPosicion: 6@3)).

		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 15:30:16'!
test17_pawnFirstMove2CellsAndThenTriesAgainMove2TilesRaisesException
	self chessWithTwoMovesPerPlayer.
	chess movePieceFrom: 5@2 to: 5@4.
	
	self should: [chess movePieceFrom: 5@4 to: 5@6] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error | 
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 5@6)).
			self assert: (chess hasPawnOn: 5@4).

		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 15:51:28'!
test18_duringWhiteTurnOnlyCanMoveWhitePieces
	self should: [chess movePieceFrom: 5@7 to: 5@6] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error | 

			self assert: (error messageText = ChessGame descriptionErrorPlayerCanOnlyMoveItsPieces).
			self deny: (chess hasPawnOn: 5@6).

		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 09:14:48'!
test19_piecesCannotMoveIntoAnotherPieceOfTheSameColor
	self should: [chess movePieceFrom: 2@1 to: 4@2] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error | 

			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 4@2)).
			self deny: (chess hasPawnOn: 5@6).

		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/30/2025 20:22:12'!
test20_posiblesMovesAreCorrectForWhiteKnight
	self assert: (chess posiblesMovesFrom: 2@1) equals: (Set with: 1@3 with: 3@3)
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/30/2025 20:37:54'!
test21_posiblesPawnMovesAreCorrectForWhitePawn
	self assert: (chess posiblesMovesFrom: 2@2) equals: (Set with: 2@3 with: 2@4).
	self assert: (chess posiblesMovesFrom: 2@7) equals: (Set with: 2@6 with: 2@5).
	
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/30/2025 20:40:01'!
test22_posiblesMovesAreCorrectForNonInitialPawn
	chess movePieceFrom: 2@2 to: 2@4. 
	self assert: (chess posiblesMovesFrom: 2@4) equals: (Set with: 2@5)
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 01:02:59'!
test23_posiblesMovesAreCorrectForBishop
	|positions|
	positions := Set with: 2@2 with: 1@3.

	chess movePieceFrom: 2@2 to: 2@3. 
	self assert: (chess posiblesMovesFrom: 3@1) equals: positions.
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 00:44:43'!
test24_posiblesMovesAreCorrectForRook
	|positions|
	positions := Set with: 1@2 with: 1@3 with: 1@4.
	self chessWithTwoMovesPerPlayer.
	chess movePieceFrom: 1@2 to: 1@4. 
	chess movePieceFrom: 1@4 to: 1@5. 

	self assert: (chess posiblesMovesFrom: 1@1) equals: positions.
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 01:17:20'!
test25_kingMovesToThePosiblePosition
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasKingOn: 5@1).
	chess movePieceFrom: 5@2 to: 5@4. 
	chess movePieceFrom: 5@1 to: 5@2. 

	self assert: (chess hasKingOn: 5@2). 
	self deny: (chess hasKingOn: 5@1). 	
	self deny: (chess hasKingOn: 4@1). 		
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 01:15:35'!
test26_queenMovesToThePosiblePosition
	self chessWithTwoMovesPerPlayer.
	self assert: (chess hasQueenOn: 4@1).
	chess movePieceFrom: 5@2 to: 5@4. 
	chess movePieceFrom: 4@1 to: 5@2. 

	self assert: (chess hasQueenOn: 5@2). 
	self deny: (chess hasQueenOn: 5@1). 	
	self deny: (chess hasQueenOn: 4@1). 		! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 01:20:07'!
test27_posibleMovesOfKingAreAroundItself
	|positions|
	positions := Set with: 4@3 with: 5@3 with: 6@3 with: 5@1.
	self chessWithTwoMovesPerPlayer.
	chess movePieceFrom: 5@2 to: 5@4. 
	chess movePieceFrom: 5@1 to: 5@2. 

	self assert: (chess posiblesMovesFrom: 5@2) equals: positions.
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 01:50:54'!
test28_posibleMovesOfQueenAreDiagonallyVerticallyAndHorizontally
	|positions|
	positions := Set new.
	positions 
			add: 4@1;
			add: 5@3;
			add: 4@3;
			add: 6@3;
			add: 3@4;
			add: 2@5;
			add: 1@6;
			add: 7@4;
			add: 8@5.
	
	self chessWithTwoMovesPerPlayer.
	chess movePieceFrom: 5@2 to: 5@4. 
	chess movePieceFrom: 4@1 to: 5@2. 
"self halt."
	self assert: (chess posiblesMovesFrom: 5@2) equals: positions.
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 12/1/2025 09:26:05'!
test29_kingTriesToMoveToPositionWithPieceOfTheSameColorRaisesAnError
	self should: [chess movePieceFrom: 5@1 to: 5@2. ] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error | 

			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 5@2)).
			self assert: (chess hasKingOn: 5@1).

		].
! !

!ChessTest methodsFor: 'simulation' stamp: 'IF 11/29/2025 10:31:39'!
manyMovesPerPlayer
	turns := {true . true . false . false} asOrderedCollection ! !

!ChessTest methodsFor: 'simulation' stamp: 'IF 11/29/2025 10:28:34'!
nextTurn
	|turn|
	turn := turns removeFirst.
	turns add: turn.
	^ turn.! !

!ChessTest methodsFor: 'simulation' stamp: 'IF 11/29/2025 10:27:58'!
standardTurn
	turns := {true . false} asOrderedCollection ! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 11/29/2025 12:26:36'!
hasBishopOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isBishop ] ]! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 12/1/2025 01:10:57'!
hasKingOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isKing ] ]! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 11/29/2025 08:22:36'!
hasKnightOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isKnight ] ]! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 11/29/2025 11:21:38'!
hasPawnOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isPawn] ]! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 12/1/2025 01:15:56'!
hasQueenOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isQueen ] ]! !

!ChessGame methodsFor: 'testing pieces position' stamp: 'IF 11/29/2025 13:05:30'!
hasRookOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isRook ] ]! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/29/2025 15:52:34'!
movePieceFrom: aPawnDirection to: aBoardDirectionToMove
	|pieceAtPosition|
	pieceAtPosition := pieces detect: [:piece | piece atPosition: aPawnDirection] ifNone: [self error: (self class descriptionErrorNoHayPiezaEnPosicion: aPawnDirection )].
	
	self isPlayerPiece: pieceAtPosition.
	
	pieceAtPosition moverHacia: aBoardDirectionToMove enElTablero: self.
	self changeTurn.! !

!ChessGame methodsFor: 'actions' stamp: 'IF 12/1/2025 01:59:49'!
posiblesMovesFrom: aPosition
	|piece posibleMove|
	piece := self pieceAtPosition: aPosition.
	posibleMove := piece posibleMoves.
	posibleMove := self posibleMovesDoesntGoAbovePiecesOfTheSameType: posibleMove.
	"self halt."
	(piece isRook or: [piece isQueen]) ifTrue: [
		1 to: 8 do: [:y | 
			(posibleMove includes: 0@y + aPosition) ifFalse: [posibleMove := self sacarPosicionesVerticalesDesde: 0@y + aPosition enPosiciones: posibleMove  ]
		]
	].
	"self halt."
	(piece isBishop or: [piece isQueen]) ifTrue: [
		1 to: 8 do: [:y | 
			((posibleMove includes: y@y + aPosition)) ifFalse: [posibleMove := posibleMove select: 
				[:position | "self halt." (position y >= (aPosition  + (y@y)) y and: [position x >= (aPosition  + (y@y)) x]) not] ].
		]
	].
	"self halt."
	^ posibleMove .! !

!ChessGame methodsFor: 'actions' stamp: 'IF 12/1/2025 01:39:20'!
sacarPosicionesVerticalesDesde: aPosition enPosiciones: aSetOfPositions
	^ aSetOfPositions select: [:position | (position y > aPosition y and: [position x = aPosition x]) not]! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:12:03'!
assertPieceAt: aPawnPosition couldMoveToABoardPosition: aBoardPositionToMove

	|positionsToMove|
	positionsToMove := self posiblesMovesFrom: aPawnPosition.
	(positionsToMove includes: aBoardPositionToMove) ifFalse: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)]! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:17:36'!
moveBlackInitialPawnFrom: aPawnPosition to: aBoardPositionToMove
	self assertPieceAt: aPawnPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (BlackPiece of: (NonInitialPawn at: aBoardPositionToMove withDirection: -1)) from: aPawnPosition . 
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:17:41'!
moveBlackNonInitialPawnFrom: aPawnPosition to: aBoardPositionToMove
	self assertPieceAt: aPawnPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (BlackPiece of: (NonInitialPawn at: aBoardPositionToMove withDirection: -1)) from: aPawnPosition . 
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/29/2025 12:18:57'!
movePiece: aPiece from: aPosition
	pieces add: aPiece.
	self removePieceAt: aPosition .! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:13:05'!
moveWhiteBishopFrom: aBishopPosition to: aBoardPositionToMove 
	self assertPieceAt: aBishopPosition couldMoveToABoardPosition: aBoardPositionToMove.
	"self assertBishopPosition: aBishopPosition isDiagonalToPositionToGo: aBoardPositionToMove."
	
	self movePiece: (WhitePiece of: (Bishop at: aBoardPositionToMove)) from: aBishopPosition . ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:17:55'!
moveWhiteInitialPawnFrom: aPawnPosition to: aBoardPositionToMove
	self assertPieceAt: aPawnPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (WhitePiece of: (NonInitialPawn at: aBoardPositionToMove withDirection: 1)) from: aPawnPosition . 
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:26:22'!
moveWhiteKingFrom: aKingPosition to: aBoardPositionToMove 
	
	self assertPieceAt: aKingPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (WhitePiece of: (King at: aBoardPositionToMove )) from: aKingPosition . ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:18:02'!
moveWhiteKnightFrom: aKnightPosition to: aBoardPositionToMove 
	
	self assertPieceAt: aKnightPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (WhitePiece of: (Knight at: aBoardPositionToMove)) from: aKnightPosition . ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:18:06'!
moveWhiteNonInitialPawnFrom: aPawnPosition to: aBoardPositionToMove
	self assertPieceAt: aPawnPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (WhitePiece of: (NonInitialPawn at: aBoardPositionToMove withDirection: 1)) from: aPawnPosition . 
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:15:38'!
moveWhiteQueenFrom: aQueenPosition to: aBoardPositionToMove 
	self assertPieceAt: aQueenPosition couldMoveToABoardPosition: aBoardPositionToMove.
	
	self movePiece: (WhitePiece of: (Queen at: aBoardPositionToMove )) from: aQueenPosition . ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 12/1/2025 09:18:19'!
moveWhiteRookFrom: aRookPosition to: aBoardPositionToMove 
	self assertPieceAt: aRookPosition couldMoveToABoardPosition: aBoardPositionToMove.
	self movePiece: (WhitePiece of: (Rook at: aBoardPositionToMove)) from: aRookPosition . ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/30/2025 18:57:14'!
pieceAtPosition: aPosition

	^ pieces detect: [:aPiece | aPiece atPosition: aPosition ]! !

!ChessGame methodsFor: 'pawn assertions' stamp: 'IF 11/29/2025 08:00:03'!
assertPawnDoestMoveFrom: aPawnDirection horizontallyTo: aBoardDirectionToMove

	^ 1@0 = (aPawnDirection - aBoardDirectionToMove) abs ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardDirectionToMove) ]! !

!ChessGame methodsFor: 'pawn assertions' stamp: 'IF 11/29/2025 12:07:34'!
assertThatBlackPawnCannotGoFrom: aPawnPosition backwardsTo: aBoardPositionToMove

	^ (aPawnPosition - aBoardPositionToMove) y <= 0 ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)]! !

!ChessGame methodsFor: 'pawn assertions' stamp: 'IF 11/29/2025 15:35:52'!
assertThatPawnInPosition: aPawnPosition movesTo: aBoardPositionToMove insideRange: aRange

	^ (aPawnPosition - aBoardPositionToMove) abs y > aRange ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)].
	! !

!ChessGame methodsFor: 'pawn assertions' stamp: 'IF 11/29/2025 12:04:55'!
assertThatWhitePawnCannotGoFrom: aPawnPosition backwardsTo: aBoardPositionToMove

	^ (aPawnPosition - aBoardPositionToMove) y >= 0 ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)]! !

!ChessGame methodsFor: 'testing turn' stamp: 'IF 11/29/2025 09:04:21'!
isBlackTurn
	^ self isWhiteTurn not! !

!ChessGame methodsFor: 'testing turn' stamp: 'IF 11/29/2025 15:52:34'!
isPlayerPiece: aPiece

	^ aPiece isWhitePiece = turnWhite ifFalse: [self error: self class descriptionErrorPlayerCanOnlyMoveItsPieces ]! !

!ChessGame methodsFor: 'testing turn' stamp: 'IF 11/29/2025 09:47:10'!
isWhiteTurn
	^ turnWhite! !

!ChessGame methodsFor: 'turns' stamp: 'IF 11/29/2025 10:33:19'!
changeTurn
	turnWhite := turnScheduler nextTurn.! !

!ChessGame methodsFor: 'noSeNombre' stamp: 'IF 12/1/2025 01:50:13'!
isInBoardPosition: aPosition
	|board|
	
	board := Rectangle origin: 1@1 corner: 9@9. "Se pone el 9@9 porque el 8@8 no sería inclusivo con las esquinas"
	^ board containsPoint: aPosition! !

!ChessGame methodsFor: 'noSeNombre' stamp: 'IF 11/30/2025 20:17:25'!
isPositionEmpty: aPosition
	^ (self isPositionWithPiece: aPosition) not! !

!ChessGame methodsFor: 'noSeNombre' stamp: 'IF 11/30/2025 20:17:00'!
isPositionWithPiece: aPosition
	^ pieces anySatisfy: [:piece | piece atPosition: aPosition ]! !

!ChessGame methodsFor: 'noSeNombre' stamp: 'IF 11/30/2025 20:14:23'!
isThereABlackPieceAtPosition: aPosition
	^ (pieces detect: [:piece | piece atPosition: aPosition ]) isBlackPiece .! !

!ChessGame methodsFor: 'noSeNombre' stamp: 'IF 11/30/2025 20:19:09'!
posibleMovesDoesntGoAbovePiecesOfTheSameType: aSetOfPosibleMoves
	^ aSetOfPosibleMoves select: [:aPosition | (self isPositionEmpty: aPosition) or: 
								  [self isThereABlackPieceAtPosition: aPosition ] ] ! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/29/2025 10:20:13'!
initializeWithPawnsPositionsIn: aCollectionOfPosition withTurnScheduler: aTurnScheduler.
	pieces := aCollectionOfPosition.
	turnScheduler := aTurnScheduler .
	turnWhite := turnScheduler nextTurn.
	! !

!ChessGame methodsFor: 'piece at position do something' stamp: 'IF 11/30/2025 18:33:52'!
isThereAnyBlackPieceAt: aBoardPositionToMove
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardPositionToMove) and: [piece isWhitePiece ]]! !

!ChessGame methodsFor: 'piece at position do something' stamp: 'IF 11/30/2025 18:31:38'!
isThereAnyWhitePieceAt: aBoardPositionToMove
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardPositionToMove) and: [piece isWhitePiece ]]! !

!ChessGame methodsFor: 'piece at position do something' stamp: 'IF 11/29/2025 07:59:19'!
removePieceAt: aPawnDirection 
	pieces := pieces select: [:piece | (piece atPosition: aPawnDirection) not].! !

!ChessGame methodsFor: 'bishop assertions' stamp: 'IF 11/29/2025 13:00:55'!
assertBishopPosition: aBishopPosition isDiagonalToPositionToGo: aBoardPositionToMove

	^ (aBishopPosition - aBoardPositionToMove) abs x = (aBishopPosition - aBoardPositionToMove) abs y  ifFalse: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)]! !

!ChessGame methodsFor: 'rook assertions' stamp: 'IF 11/29/2025 13:25:28'!
assertRookPosition: aBoardPositionToMove goesVerticallyOrHorizontallyTo: aRookPosition

	^ ((aRookPosition - aBoardPositionToMove) x = 0 or: [
		(aRookPosition - aBoardPositionToMove) y = 0]) ifFalse: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove )]! !

!ChessGame methodsFor: 'knight assertions' stamp: 'IF 11/29/2025 13:14:47'!
assertKnightPosition: aKnightPosition triesToMoveInLShapeTo: aBoardPositionToMove
	
	((aKnightPosition - aBoardPositionToMove) abs = (1@2) or: [
		(aKnightPosition - aBoardPositionToMove) abs = (2@1)
	] ) ifFalse: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardPositionToMove)].! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 08:34:55'!
descriptionErrorNoHayPiezaEnPosicion: aPosition
	^ 'No hay pieza en la posicion: ' , aPosition asString! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 07:30:25'!
descriptionErrorNoSePuedeMoverAPosicion: aPosition
	^ 'No se puede moverse a la posicion: ' , aPosition asString! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/30/2025 18:21:41'!
descriptionErrorPiecesCannotMoveAboveOtherPiece
	^ 'Las piezas de un color no se pueden mover sobre las piezas del mismo jugador'! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 15:39:44'!
descriptionErrorPlayerCanOnlyMoveItsPieces
	^ 'Cada jugador solo puede mover sus propias piezas' ! !

!ChessGame class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 10:19:39'!
withPawnsOn: aCollectionOfPosition withTurnsScheduler: aTurnScheduler.
	^ self new initializeWithPawnsPositionsIn: aCollectionOfPosition withTurnScheduler: aTurnScheduler.! !

!ColorPiece methodsFor: 'initialization' stamp: 'IF 11/29/2025 11:13:52'!
initializeOf: aPiece 
	piece := aPiece ! !

!ColorPiece methodsFor: 'position' stamp: 'IF 11/29/2025 11:21:20'!
atPosition: aPosition

	^ piece atPosition: aPosition ! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:22:57'!
isBishop
	^ piece isBishop .! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:23:03'!
isKing
	^ piece isKing.! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:23:08'!
isKnight
	^ piece isKnight .! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:23:12'!
isPawn
	^ piece isPawn .! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:23:20'!
isQueen
	^ piece isQueen .! !

!ColorPiece methodsFor: 'isPiece' stamp: 'IF 11/29/2025 11:23:24'!
isRook
	^ piece isRook .! !

!ColorPiece methodsFor: 'actions' stamp: 'IF 11/29/2025 11:25:50'!
moverHacia: aBoardPosition enElTablero: aChessBoard

	self subclassResponsibility! !

!ColorPiece methodsFor: 'actions' stamp: 'IF 11/30/2025 18:59:53'!
posibleMoves
	^ piece posibleMoves ! !

!ColorPiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:47:10'!
isBlackPiece

	self subclassResponsibility! !

!ColorPiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:47:11'!
isWhitePiece

	self subclassResponsibility! !

!ColorPiece class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 11:13:16'!
of: aPiece
	^ self new initializeOf: aPiece ! !

!BlackPiece methodsFor: 'actions' stamp: 'IF 11/29/2025 11:25:00'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	piece moverNegraHacia: aBoardPosition enElTablero: aChessBoard ! !

!BlackPiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:47:26'!
isBlackPiece

	^ true! !

!BlackPiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:47:17'!
isWhitePiece

	^ false! !

!WhitePiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:46:34'!
isBlackPiece
	^ false! !

!WhitePiece methodsFor: 'assertion' stamp: 'IF 11/29/2025 15:46:27'!
isWhitePiece
	^ true! !

!WhitePiece methodsFor: 'actions' stamp: 'IF 11/29/2025 11:25:57'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	piece moverBlancaHacia: aBoardPosition enElTablero: aChessBoard ! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:16'!
isBishop

	self subclassResponsibility! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:16'!
isKing

	self subclassResponsibility! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:16'!
isKnight

	self subclassResponsibility! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:16'!
isPawn

	self subclassResponsibility! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:17'!
isQueen

	self subclassResponsibility! !

!Pieces methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:17'!
isRook

	self subclassResponsibility! !

!Pieces methodsFor: 'action' stamp: 'IF 11/29/2025 11:11:40'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard

	self subclassResponsibility! !

!Pieces methodsFor: 'action' stamp: 'IF 11/29/2025 11:12:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard

	self subclassResponsibility! !

!Pieces methodsFor: 'action' stamp: 'IF 11/30/2025 20:31:31'!
selectAllPosibleMovesInsideBoard: posibleMoves
	|board|
	board := Rectangle origin: 1@1 corner: 9@9. "Se pone el 9@9 porque el 8@8 no sería inclusivo con las esquinas"
	^ posibleMoves select: [:aPosiblePosition | board containsPoint: aPosiblePosition ].! !

!Pieces methodsFor: 'initialization' stamp: 'IF 11/29/2025 12:29:48'!
initializeAt: aPosition 
	position := aPosition! !

!Pieces methodsFor: 'initialization' stamp: 'IF 11/30/2025 18:45:26'!
posibleMoves

	self subclassResponsibility! !

!Pieces methodsFor: 'position' stamp: 'IF 11/29/2025 08:30:54'!
atPosition: aPosition

	^ position = aPosition ! !

!Pieces class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 13:07:06'!
at: aBoardPosition
	^ self new initializeAt: aBoardPosition ! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:23'!
isBishop
	^ true! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:26'!
isKing
	^ false.! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:28'!
isKnight
	^ false.! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:28'!
isPawn
	^ false.! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:31'!
isQueen
	^ false.! !

!Bishop methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:34'!
isRook
	^ false.! !

!Bishop methodsFor: 'action' stamp: 'IF 11/29/2025 13:09:15'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteBishopFrom: position to: aBoardPosition ! !

!Bishop methodsFor: 'action' stamp: 'IF 11/29/2025 11:12:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!Bishop methodsFor: 'action' stamp: 'IF 11/30/2025 23:26:03'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new.
	1 to: 8 do: [:x | 
		posibleMoves add: x@x +  position.
		posibleMoves add: (x * -1)@x +  position.
		posibleMoves add: x@(x * -1) +  position.
		posibleMoves add: (x * -1)@(x * -1) +  position.
	]. 
	posibleMoves := self selectAllPosibleMovesInsideBoard: posibleMoves.
	
	
	^ posibleMoves.! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:37'!
isBishop
	^ false.! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:54'!
isKing
	^ true! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:41'!
isKnight
	^ false.! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:44'!
isPawn
	^ false.! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:47'!
isQueen
	^ false.! !

!King methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:49'!
isRook
	^ false.! !

!King methodsFor: 'action' stamp: 'IF 12/1/2025 01:11:56'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteKingFrom: position to: aBoardPosition ! !

!King methodsFor: 'action' stamp: 'IF 11/29/2025 11:12:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!King methodsFor: 'action' stamp: 'IF 12/1/2025 01:24:43'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new. 
	posibleMoves 
				add: 0@1 + position;
				add: 1@0 + position;
				add: 0@-1 + position;
				add: -1@0 + position;
				add: 1@1 + position;
				add: 1@-1 + position;
				add: -1@1 + position;
				add: -1@-1 + position.
				
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:19:58'!
isBishop
	^ false.! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:00'!
isKing
	^ false.! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:14'!
isKnight
	^ true! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:04'!
isPawn
	^ false.! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:06'!
isQueen
	^ false.! !

!Knight methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:09'!
isRook
	^ false.! !

!Knight methodsFor: 'action' stamp: 'IF 11/29/2025 13:11:58'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteKnightFrom: position to: aBoardPosition ! !

!Knight methodsFor: 'action' stamp: 'IF 11/29/2025 11:12:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!Knight methodsFor: 'action' stamp: 'IF 11/30/2025 20:31:07'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new. 
	posibleMoves add: 1@2 + position.
	posibleMoves add: 1@-2 + position.
	posibleMoves add: -1@2 + position.
	posibleMoves add: -1@-2 + position.
	posibleMoves add: 2@1 + position.
	posibleMoves add: 2@-1 + position.
	posibleMoves add: -2@1 + position.
	posibleMoves add: -2@-1 + position.
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !

!Pawn methodsFor: 'initialization' stamp: 'IF 11/30/2025 20:25:25'!
initializeAt: aBoardPosition withDirection: aDirection
	position := aBoardPosition.
	direction := aDirection ! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:19'!
isBishop
	^ false.! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:22'!
isKing
	^ false.! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:24'!
isKnight
	^ false.! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:28'!
isPawn
	^ true! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:31'!
isQueen
	^ false.! !

!Pawn methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:33'!
isRook
	^ false.! !

!Pawn class methodsFor: 'instance creation' stamp: 'IF 11/30/2025 20:24:59'!
at: aBoardPosition withDirection: aDirection
	^ self new initializeAt: aBoardPosition withDirection: aDirection! !

!InitialPawn methodsFor: 'action' stamp: 'IF 11/29/2025 15:26:00'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteInitialPawnFrom: position to: aBoardPosition ! !

!InitialPawn methodsFor: 'action' stamp: 'IF 11/29/2025 15:26:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveBlackInitialPawnFrom: position to: aBoardPosition ! !

!InitialPawn methodsFor: 'action' stamp: 'IF 11/30/2025 20:36:08'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new. 
	posibleMoves add: 0@direction +  position;
				  add: 0@(direction * 2) +  position.
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !

!NonInitialPawn methodsFor: 'action' stamp: 'IF 11/29/2025 15:28:10'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteNonInitialPawnFrom: position to: aBoardPosition ! !

!NonInitialPawn methodsFor: 'action' stamp: 'IF 11/29/2025 15:28:15'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveBlackNonInitialPawnFrom: position to: aBoardPosition ! !

!NonInitialPawn methodsFor: 'action' stamp: 'IF 11/30/2025 20:40:51'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new. 
	posibleMoves add: 0@direction +  position.
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:29'!
isBishop
	^ false! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:22'!
isKing
	^ false! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:26'!
isKnight
	^ false! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:19'!
isPawn
	^ false! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:13'!
isQueen
	^ true! !

!Queen methodsFor: 'isPiece' stamp: 'IF 12/1/2025 00:41:32'!
isRook
	^ false! !

!Queen methodsFor: 'action' stamp: 'IF 12/1/2025 01:16:32'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteQueenFrom: position to: aBoardPosition ! !

!Queen methodsFor: 'action' stamp: 'IF 12/1/2025 00:40:05'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!Queen methodsFor: 'action' stamp: 'IF 12/1/2025 01:28:59'!
posibleMoves
	|posibleMoves rook bishop|
	rook := Rook at: position.
	bishop := Bishop at: position.
	posibleMoves := rook posibleMoves union: bishop posibleMoves .
	
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:00'!
isBishop
	^ false.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:02'!
isKing
	^ false.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:05'!
isKnight
	^ false.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:07'!
isPawn
	^ false.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:10'!
isQueen
	^ false.! !

!Rook methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:21:14'!
isRook
	^ true! !

!Rook methodsFor: 'action' stamp: 'IF 11/29/2025 13:16:10'!
moverBlancaHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveWhiteRookFrom: position to: aBoardPosition ! !

!Rook methodsFor: 'action' stamp: 'IF 11/29/2025 11:12:16'!
moverNegraHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!Rook methodsFor: 'action' stamp: 'IF 12/1/2025 00:36:59'!
posibleMoves
	|posibleMoves |
	posibleMoves := Set new. 
	1 to: 8 do: [:x | 
		posibleMoves add: 0@x +  position.
		posibleMoves add: x@0 +  position.
		posibleMoves add: 0@(x * -1) +  position.
		posibleMoves add: (x * -1)@0 +  position.
	].
	^ self selectAllPosibleMovesInsideBoard: posibleMoves.! !
