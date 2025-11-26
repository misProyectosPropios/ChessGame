'From Cuis7.2 [latest update: #6897] on 26 November 2025 at 9:40:00 am'!
'Description '!
!provides: 'Chess' 1 0!
SystemOrganization addCategory: #chess!


!classDefinition: #ChessTest category: #chess!
TestCase subclass: #ChessTest
	instanceVariableNames: ''
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


!ChessTest methodsFor: 'tests' stamp: 'IF 11/26/2025 09:38:54'!
test01_pawnMoveToE3GetsChangeToThisPosition
	|chess|
	chess := ChessGame new.
	self assert: (chess hasPawnOn: 'e2').
	chess movePawnFrom: 'e2' to: 'e3'.
	self assert: (chess hasPawnOn: 'e3').! !

!ChessTest methodsFor: 'tests' stamp: 'IF 11/26/2025 09:37:38'!
test02_pawnMoveFromE2ToE3IsNotInE2
	|chess|
	chess := ChessGame new.
	chess movePawnFrom: 'e2' to: 'e3'.
	self deny: (chess hasPawnOn: 'e2')! !

!ChessGame methodsFor: 'testing' stamp: 'IF 11/26/2025 09:38:36'!
hasPawnOn: aBoardDirection
	^ pawn = aBoardDirection ! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/26/2025 09:34:58'!
movePawn: aBoardDirection
	! !

!ChessGame methodsFor: 'actions' stamp: 'IF 11/26/2025 09:38:27'!
movePawnFrom: aPawnDirection to: aBoardDirectionToMove
	pawn := aBoardDirectionToMove ! !

!ChessGame methodsFor: 'initialization' stamp: 'IF 11/26/2025 09:38:15'!
initialize
	pawn := 'e2'! !
