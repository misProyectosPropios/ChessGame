'From Cuis7.2 [latest update: #6897] on 29 November 2025 at 8:00:16 am'!
'Description '!
!provides: 'Chess' 1 3!
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


!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 07:53:48'!
whitePawnPosition
	 
	whitePiecesPosition := Set new.
	1 to: 8 do: [:x | whitePiecesPosition add: (Pawn at: x@2)].! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:48:44'!
setUp
	self whitePawnPosition .
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

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:38:48'!
test03_tryMovingPawnToSideRaisesAnError
	
	self should: [chess movePieceFrom: 5@2 to: 6@2.] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 6@2)).
			self assert: (chess hasPawnOn: 5@2).
		].
	
	! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:45:26'!
test04_tryMovingPawnMoreThan2CellsAboveRaisesAnError
	
	self should: [chess movePieceFrom: 5@2 to: 5@5.] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:error |
			self assert: (error messageText = (ChessGame descriptionErrorNoSePuedeMoverAPosicion: 5@5)).
			self assert: (chess hasPawnOn: 5@2).
		].
	
	! !

!ChessGame methodsFor: 'testing' stamp: 'IF 11/29/2025 07:58:38'!
hasPawnOn: aBoardDirection
	^ pieces anySatisfy: [:piece2 | piece2 atPosition: aBoardDirection ]! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/29/2025 07:34:07'!
movePieceFrom: aPawnDirection to: aBoardDirectionToMove

	self movePawnFrom: aPawnDirection to: aBoardDirectionToMove .
	! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/29/2025 08:00:03'!
assertPawnDoestMoveFrom: aPawnDirection horizontallyTo: aBoardDirectionToMove

	^ 1@0 = (aPawnDirection - aBoardDirectionToMove) abs ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardDirectionToMove) ]! !

!ChessGame methodsFor: 'pieces movement' stamp: 'IF 11/29/2025 08:00:13'!
movePawnFrom: aPawnDirection to: aBoardDirectionToMove
	|pawnPiece|
	self assertPawnDoestMoveFrom: aPawnDirection horizontallyTo: aBoardDirectionToMove. 
	
	(aPawnDirection - aBoardDirectionToMove) abs y > 2 ifTrue: [self error: (self class descriptionErrorNoSePuedeMoverAPosicion: aBoardDirectionToMove)].
	
	pawnPiece := Pawn at: aBoardDirectionToMove.
	pieces add: pawnPiece.
	self removePieceAt: aPawnDirection ! !

!ChessGame methodsFor: 'boardmmmmmmm' stamp: 'IF 11/29/2025 07:59:19'!
removePieceAt: aPawnDirection 
	pieces := pieces select: [:piece | (piece atPosition: aPawnDirection) not].! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/29/2025 07:58:38'!
initializeWithPawnsPositionsIn: aCollectionOfPosition 
	pieces := aCollectionOfPosition ! !

!ChessGame class methodsFor: 'description error' stamp: 'IF 11/29/2025 07:30:25'!
descriptionErrorNoSePuedeMoverAPosicion: aPosition
	^ 'No se puede moverse a la posicion: ' , aPosition asString! !

!ChessGame class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 07:06:05'!
withPawnsOn: aCollectionOfPosition
	^ self new initializeWithPawnsPositionsIn: aCollectionOfPosition ! !

!Pieces methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:03'!
atPosition: aPosition

	self subclassResponsibility! !

!Bishop methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:03'!
atPosition: aPosition
	self subclassResponsibility ! !

!King methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:02'!
atPosition: aPosition
	self subclassResponsibility ! !

!Knight methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:02'!
atPosition: aPosition
	self subclassResponsibility ! !

!Pawn methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:24'!
atPosition: aPosition
	^ position = aPosition ! !

!Pawn methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:54:30'!
initializeAt: aBoardPosition 
	position := aBoardPosition ! !

!Pawn class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 07:54:16'!
at: aBoardPosition
	^ self new initializeAt: aBoardPosition ! !

!Queen methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:03'!
atPosition: aPosition
	self subclassResponsibility ! !

!Rook methodsFor: 'as yet unclassified' stamp: 'IF 11/29/2025 07:56:03'!
atPosition: aPosition
	self subclassResponsibility ! !
