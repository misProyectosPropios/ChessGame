'From Cuis7.2 [latest update: #6897] on 29 November 2025 at 7:22:12 am'!
'Description '!
!provides: 'Chess' 1 1!
SystemOrganization addCategory: #chess!


!classDefinition: #ChessTest category: #chess!
TestCase subclass: #ChessTest
	instanceVariableNames: 'chess pawnPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessTest class' category: #chess!
ChessTest class
	instanceVariableNames: ''!

!classDefinition: #ChessGame category: #chess!
Object subclass: #ChessGame
	instanceVariableNames: 'pawn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'chess'!
!classDefinition: 'ChessGame class' category: #chess!
ChessGame class
	instanceVariableNames: ''!


!ChessTest methodsFor: 'creation objects' stamp: 'IF 11/29/2025 07:10:38'!
whitePawnPosition
	 
	pawnPosition := Set new.
	1 to: 8 do: [:x | pawnPosition add: x@2].! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:17:31'!
setUp
	self whitePawnPosition .
	chess := ChessGame withPawnsOn: pawnPosition ! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:20:18'!
test01_movePieceFromE2ToE3HasPawnOnTheNewPosition
	 chess := ChessGame withPawnsOn: pawnPosition .
	self assert: (chess hasPawnOn: 5@2).
	chess movePieceFrom: 5@2 to: 5@3.
	self assert: (chess hasPawnOn: 5@3).! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/29/2025 07:22:00'!
test02_pawnMoveFromE2ToE3IsNotInE2

	chess movePieceFrom: 5@2 to: 5@3.
	self deny: (chess hasPawnOn: 5@2)! !

!ChessGame methodsFor: 'testing' stamp: 'IF 11/29/2025 07:20:38'!
hasPawnOn: aBoardDirection
	^ pawn includes: aBoardDirection ! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/29/2025 07:21:37'!
movePieceFrom: aPawnDirection to: aBoardDirectionToMove
	pawn add: aBoardDirectionToMove;
		  remove: aPawnDirection ! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/26/2025 09:38:15'!
initialize
	pawn := 'e2'! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/29/2025 07:06:26'!
initializeWithPawnsPositionsIn: aCollectionOfPosition 
	pawn := aCollectionOfPosition ! !

!ChessGame class methodsFor: 'instance creation' stamp: 'IF 11/29/2025 07:06:05'!
withPawnsOn: aCollectionOfPosition
	^ self new initializeWithPawnsPositionsIn: aCollectionOfPosition ! !
