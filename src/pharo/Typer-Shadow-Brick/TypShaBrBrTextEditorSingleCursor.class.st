Class {
	#name : #TypShaBrBrTextEditorSingleCursor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorSingleCursor class >> shadowedClass [
	^ BrTextEditorSingleCursor class
]

{ #category : #accessing }
TypShaBrBrTextEditorSingleCursor >> ___position [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]
