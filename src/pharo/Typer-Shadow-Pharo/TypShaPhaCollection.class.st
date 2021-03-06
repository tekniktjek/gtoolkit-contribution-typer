Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance asNullableType ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsTypeVariableType
				assign: (a argumentTypes at: 1)
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection class >> ___with: _a with: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsTypeVariableType
				assign:
					{(a argumentTypes at: 1).
					(a argumentTypes at: 2)} typAsType
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection class >> ___withAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| instanceType |
			instanceType := a receiverType classDescription instanceSide
				typAsType copy.
			'@A' typAsTypeVariableType
				assign: ('@A' typAsTypeVariableType resolveIn: (a argumentTypes at: 1))
				in: instanceType.
			instanceType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #accessing }
TypShaPhaCollection >> ___add: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___addAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType))} asDictionary ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___allSatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anyOne [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___anySatisfy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsTypeVariableType resolveIn: a receiverType.
			type := Dictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' -> ('@A' typAsTypeVariableType resolveIn: elementType)).
							('@A' -> ('@B' typAsTypeVariableType resolveIn: elementType))} asDictionary ].
			type ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asIdentitySet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			IdentitySet typAsType
				copyWithBindings: {('@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___asOrderedCollection [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				copyWithBindings: {('@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asOrderedDictionary [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			| elementType type |
			elementType := '@A' typAsTypeVariableType resolveIn: a receiverType.
			type := OrderedDictionary typAsType.
			Association typAsType >= elementType
				ifTrue: [ type := type
						copyWithBindings:
							{('@B' -> ('@A' typAsTypeVariableType resolveIn: elementType)).
							('@A' -> ('@B' typAsTypeVariableType resolveIn: elementType))} asDictionary ].
			type ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___asSet [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Set typAsType
				copyWithBindings: {('@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType))} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___at: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsTypeVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithout: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___copyWithoutAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifFound: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: TypUnknownType instance
						argumentsOptional: true)} typAsType ] ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {Symbol typAsType.
							(BlockClosure
								typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
								result: TypUnknownType instance
								argumentsOptional: true)} typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithArguments: {}
								result: TypUnknownType instance
								argumentsOptional: false ] ] ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsTypeVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___detect: _a ifNone: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: Boolean typAsType
						argumentsOptional: false)} typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a | 
			{('@A' typAsTypeVariableType resolveIn: a receiverType).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___do: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #enumerating }
TypShaPhaCollection >> ___flatCollect: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result isParametric
						ifTrue: [ '@A' typAsTypeVariableType resolveIn: (argumentType result) ]
						ifFalse: [ TypUnknownType instance ] ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ '@A' typAsTypeVariableType resolveIn: (TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsTypeVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself)) ]
						ifFalse: [ TypUnknownType instance ] ].
			a receiverType
				copyWithBindings: {('@A' -> elementType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: TypUnknownType instance
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode keyType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			keyType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsTypeVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ '@B' typAsTypeVariableType ] ].
			OrderedDictionary typAsType
				copyWithBindings:
					{('@B' -> keyType).
					('@A'
						->
							(Collection typAsType
								copyWithBindings: {('@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType))} asDictionary))}
						asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___gtItemsFor: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtPhlowView typAsType ];
		resultType: [ :a :s :r | GtPhlowView typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifEmpty: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | 
			{a receiverType.
			(a argumentTypes at: 1) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifEmpty: _a ifNotEmpty: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {a receiverType}
						result: TypUnknownType instance
						argumentsOptional: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{(a argumentTypes at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___ifNotEmpty: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {a receiverType}
				result: TypUnknownType instance
				argumentsOptional: true)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{a receiverType.
			elementType} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___includes: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___includesAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType copyWithBindings: {'@A' -> ('@A' typAsTypeVariableType resolveIn: a receiverType)} asDictionary ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___inject: _a into: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments:
							{(a argumentTypes at: 1).
							('@A' typAsTypeVariableType resolveIn: a receiverType)}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___isEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___isNotEmpty [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___max [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Number typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___reduce: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{{('@A' typAsTypeVariableType resolveIn: a receiverType).
					(a argumentTypes at: 1) result} typAsType.
					('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___reject: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | a receiverType at: '@A' ];
		resultType: [ :a :s :r | a receiverType at: '@A' ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___remove: _a ifAbsent: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ '@A' typAsTypeVariableType resolveIn: a receiverType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 1).
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___select: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {('@A' typAsTypeVariableType resolveIn: a receiverType)}
				result: Boolean typAsType
				argumentsOptional: false)} typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___size [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@A'}
]

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | 
			| result |
			result := a receiverType copy.
			'@A' typAsType
				assign:
					{('@A' typAsTypeVariableType resolveIn: a receiverType).
					('@A' typAsTypeVariableType resolveIn: (a argumentTypes at: 1))} typAsType
				in: result.
			result ];
		yourself
]
