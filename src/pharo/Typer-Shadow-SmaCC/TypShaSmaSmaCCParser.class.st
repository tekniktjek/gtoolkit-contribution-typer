Class {
	#name : #TypShaSmaSmaCCParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-SmaCC'
}

{ #category : #accessing }
TypShaSmaSmaCCParser class >> ___parse: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaSmaSmaCCParser class >> shadowedClass [
	^ SmaCCParser class
]
