'From Cuis7.2 [latest update: #6897] on 29 November 2025 at 8:51:57 am'!
'Description '!
!provides: 'Chess' 1 5!
SystemOrganization addCategory: #chess!


!classDefinition: #ChessTest category: #chess!
TestCase subclass: #ChessTest
	instanceVariableNames: 'chess whitePiecesPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessTest class' category: #chess!
ChessTest class
	instanceVariableNames: ''!

!classDefinition: #ChessGame category: #chess!
Object subclass: #ChessGame
	instanceVariableNames: 'pieces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessGame class' category: #chess!
ChessGame class
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'Pawn class' category: #chess!
Pawn class
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


!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 08:27:48'!
whitePiecesPosition
	 
	whitePiecesPosition := Set new.
	1 to: 8 do: [:x | whitePiecesPosition add: (Pawn at: x@2)].
	whitePiecesPosition add: (Knight at: 2@1);
						add: (Knight at: 7@1).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 08:26:59'!
setUp
	self whitePiecesPosition .
	chess := ChessGame withPawnsOn: whitePiecesPosition ! !

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

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 08:49:57'!
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

!ChessGame methodsFor: 'testing' stamp: 'IF 11/29/2025 08:22:36'!
hasKnightOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isKnight ] ]! !

!ChessGame methodsFor: 'testing' stamp: 'IF 11/29/2025 08:22:18'!
hasPawnOn: aBoardDirection
	^ pieces anySatisfy: [:piece | (piece atPosition: aBoardDirection) and: [piece isPawn] ]! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/29/2025 08:45:32'!
movePieceFrom: aPawnDirection to: aBoardDirectionToMove
	|pieceAtPosition|
	pieceAtPosition := pieces detect: [:piece | piece atPosition: aPawnDirection] ifNone: [self error: (self class descriptionErrorNoHayPiezaEnPosicion: aPawnDirection )].

	pieceAtPosition moverHacia: aBoardDirectionToMove enElTablero: self.
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/29/2025 08:44:19'!
moveKnightFrom: aKnightPosition to: aBoardPositionToMove 
	|knight|
	knight := Knight at: aBoardPositionToMove.
	pieces add: knight.
	self removePieceAt: aKnightPosition ! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/29/2025 08:00:13'!
movePawnFrom: aPawnDirection to: aBoardDirectionToMove
	|pawnPiece|
	self assertPawnDoestMoveFrom: aPawnDirection horizontallyTo: aBoardDirectionToMove. 
	
	(aPawnDirection - aBoardDirectionToMove) abs y > 2 ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardDirectionToMove)].
	
	pawnPiece := Pawn at: aBoardDirectionToMove.
	pieces add: pawnPiece.
	self removePieceAt: aPawnDirection ! !

!ChessGame methodsFor: 'pawn assertions' stamp: 'IF 11/29/2025 08:00:03'!
assertPawnDoestMoveFrom: aPawnDirection horizontallyTo: aBoardDirectionToMove

	^ 1@0 = (aPawnDirection - aBoardDirectionToMove) abs ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardDirectionToMove) ]! !

!ChessGame methodsFor: 'remove piece' stamp: 'IF 11/29/2025 07:59:19'!
removePieceAt: aPawnDirection 
	pieces := pieces select: [:piece | (piece atPosition: aPawnDirection) not].! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/29/2025 07:58:38'!
initializeWithPawnsPositionsIn: aCollectionOfPosition 
	pieces := aCollectionOfPosition ! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 08:34:55'!
descriptionErrorNoHayPiezaEnPosicion: aPosition
	^ 'No hay pieza en la posicion: ' , aPosition asString! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 07:30:25'!
descriptionErrorNoSePuedeMoverAPosicion: aPosition
	^ 'No se puede moverse a la posicion: ' , aPosition asString! !

!ChessGame class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 07:06:05'!
withPawnsOn: aCollectionOfPosition
	^ self new initializeWithPawnsPositionsIn: aCollectionOfPosition ! !

!Pieces methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 08:30:54'!
atPosition: aPosition

	^ position = aPosition ! !

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

!Pieces methodsFor: 'action' stamp: 'IF 11/29/2025 08:40:44'!
moverHacia: aBoardPosition enElTablero: aChessBoard

	self subclassResponsibility! !

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

!Bishop methodsFor: 'action' stamp: 'IF 11/29/2025 08:40:36'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

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

!King methodsFor: 'action' stamp: 'IF 11/29/2025 08:40:36'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

!Knight methodsFor: 'initialization' stamp: 'IF 11/29/2025 08:29:49'!
initializeAt: aPosition 
	position := aPosition! !

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

!Knight methodsFor: 'action' stamp: 'IF 11/29/2025 08:41:21'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard moveKnightFrom: position to: aBoardPosition ! !

!Knight class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 08:28:09'!
at: aBoardPosition
	^ self new initializeAt: aBoardPosition ! !

!Pawn methodsFor: 'initialization' stamp: 'IF 11/29/2025 07:54:30'!
initializeAt: aBoardPosition 
	position := aBoardPosition ! !

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

!Pawn methodsFor: 'action' stamp: 'IF 11/29/2025 08:41:07'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	aChessBoard movePawnFrom: position to: aBoardPosition ! !

!Pawn class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 07:54:16'!
at: aBoardPosition
	^ self new initializeAt: aBoardPosition ! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:37'!
isBishop
	^ false.! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:39'!
isKing
	^ false.! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:42'!
isKnight
	^ false.! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:44'!
isPawn
	^ false.! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:50'!
isQueen
	^ true! !

!Queen methodsFor: 'isPiece' stamp: 'IF 11/29/2025 08:20:53'!
isRook
	^ false.! !

!Queen methodsFor: 'initialization' stamp: 'IF 11/29/2025 08:29:15'!
initializeAt: aPosition
	position := aPosition ! !

!Queen methodsFor: 'action' stamp: 'IF 11/29/2025 08:40:36'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !

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

!Rook methodsFor: 'action' stamp: 'IF 11/29/2025 08:40:36'!
moverHacia: aBoardPosition enElTablero: aChessBoard
	self subclassResponsibility ! !
