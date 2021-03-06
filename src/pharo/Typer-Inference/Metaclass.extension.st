Extension { #name : #Metaclass }

{ #category : #'*Typer-Inference' }
Metaclass >> typInfAsVariableLookupResultFor: aSymbol [
	^ (self allInstVarNames includes: aSymbol)
		ifTrue: [ | type |
			type := self
				typInfVariableAssignedTypeFor: aSymbol
				in: self allMethods.
			TypVariableLookupResult new
				type: [ type ];
				yourself ]
]
