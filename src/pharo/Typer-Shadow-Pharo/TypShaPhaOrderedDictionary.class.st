Class {
	#name : #TypShaPhaOrderedDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary class >> shadowedClass [
	^ OrderedDictionary class
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' typAsType -> (a receiverType bindings at: '@B' typAsType)).
					('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___associations [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithBindings:
					{('@A' typAsType
						->
							(Association typAsType
								copyWithBindings:
									{('@A' typAsType -> (a receiverType bindings at: '@B' typAsType)).
									('@B' typAsType -> (a receiverType bindings at: '@A' typAsType))}
										typAsTypeVariableBindings))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___associationsDo: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{(Association typAsType
						copyWithBindings:
							{('@A' typAsType -> (a receiverType bindings at: '@B' typAsType)).
							('@B' typAsType -> (a receiverType bindings at: '@A' typAsType))}
								typAsTypeVariableBindings)}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType bindings at: '@B' typAsType ];
		resultType: [ :a :s :r | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType bindings at: '@B' typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: (a receiverType bindings at: '@A' typAsType)
						argumentsOptional: false ] ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___at: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{(a receiverType bindings at: '@B' typAsType).
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
				argumentsOptional: true).
			(BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false)} ];
		resultType: [ :a :s | 
			{(a argumentTypes at: 2) result.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___at: _a put: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType bindings at: '@B' typAsType ]
				ifFalse: [ a receiverType bindings at: '@A' typAsType ] ];
		resultType: [ :a | a receiverType bindings at: '@A' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {(a receiverType bindings at: '@A' typAsType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: String)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (a receiverType bindings at: '@A' typAsType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings:
					{('@B' typAsType -> (a receiverType bindings at: '@B' typAsType)).
					('@A' typAsType -> elementType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindings at: '@A' typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___includesKey: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | a receiverType bindings at: '@B' typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> ___keys [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Array typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@B' typAsType))} typAsTypeVariableBindings ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaOrderedDictionary >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters:
			{'@B' typAsType.
			'@A' typAsType}
]

{ #category : #accessing }
TypShaPhaOrderedDictionary >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | OrderedDictionary typAsType ];
		resultType: [ :a :s :r | 
			a receiverType
				copyWithBindings:
					{('@B' typAsType
						->
							{(a receiverType bindings at: '@B' typAsType).
							((a argumentTypes at: 1) bindings at: '@B' typAsType)} typAsType).
					('@A' typAsType
						->
							{(a receiverType bindings at: '@A' typAsType).
							((a argumentTypes at: 1) bindings at: '@A' typAsType)} typAsType)}
						typAsTypeVariableBindings ];
		yourself
]