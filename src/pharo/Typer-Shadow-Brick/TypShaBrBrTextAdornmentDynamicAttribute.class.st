Class {
	#name : #TypShaBrBrTextAdornmentDynamicAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextAdornmentDynamicAttribute class >> shadowedClass [
	^ BrTextAdornmentDynamicAttribute class
]

{ #category : #accessing }
TypShaBrBrTextAdornmentDynamicAttribute >> ___stencil: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: BlElement typAsType
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
