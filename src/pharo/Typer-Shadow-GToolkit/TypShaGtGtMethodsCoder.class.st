Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#instVars : [
		'___methods',
		'___methodCoders'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtMethodsCoder class >> ___forMethods: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> CompiledMethod typAsType)} asDictionary ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> ___announce: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Announcement typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> initialize [
	super initialize.
	___methods := TypVariableLookupResult new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> CompiledMethod typAsType)} asDictionary ];
		yourself.
	___methodCoders := TypVariableLookupResult new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> GtMethodCoder typAsType)} asDictionary ];
		yourself
]
