Class {
	#name : #TypUnionTypeExamples,
	#superclass : #TypTypeExamples,
	#category : #'Typer-Core-Examples-Type'
}

{ #category : #converting }
TypUnionTypeExamples >> asNamedType [
	<gtExample>
	| type |
	type := self type.
	self assert: type asNamedType = self typeInteger.
	self assert: self typeSmallIntegerAndTrue asNamedType = self typeObject.
	self
		assert: [ self typeWithUnknown asNamedType ]
		signals: TypNoTypeError.
	self assert: [ self typeWithNil asNamedType ] signals: TypNoTypeError.
	self
		assert: [ self typeWithUnknownAndNil asNamedType ]
		signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> asTypeCompatibleWith [
	<gtExample>
	| type |
	type := self type.
	self
		assert:
			(type asTypeCompatibleWith: TypUnknownType instance)
				= self typeWithUnknown.
	self
		assert: (type asTypeCompatibleWith: TypNilType instance) = type asNullableType.
	self
		assert: (type asTypeCompatibleWith: TypNilType instance) = self typeWithNil.
	self
		assert: (type asTypeCompatibleWith: self typeInteger) = self typeInteger.
	self
		assert:
			(type asTypeCompatibleWith: self typeProtoObject)
				= self typeProtoObject.
	self
		assert:
			(type asTypeCompatibleWith: self typeNotAClass)
				= (type types , {self typeNotAClass}) typAsType.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> classDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type classDescription = Integer.
	self
		assert: [ self typeWithNil classDescription ]
		signals: TypNoClassDescriptionError.
	self
		assert: [ self typeWithUnknown classDescription ]
		signals: TypNoClassDescriptionError.
	self
		assert: [ self typeWithUnknownAndNil classDescription ]
		signals: TypNoClassDescriptionError.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> hasSuperType [
	<gtExample>
	| type |
	type := self type.
	self assert: type hasSuperType.
	self assert: self typeWithNil hasSuperType.
	self assert: self typeWithUnknown hasSuperType.
	self assert: self typeWithUnknownAndNil hasSuperType.
	self assert: self typeSmallIntegerAndTrue hasSuperType.
	self assert: self typeWithNil superType hasSuperType not.
	self assert: self typeWithUnknown superType hasSuperType not.
	self assert: self typeWithUnknownAndNil superType hasSuperType not.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> isFunction [
	<gtExample>
	| type |
	type := self type.
	self assert: false description: 'add positive assertion'.
	self assert: type isFunction not.
	self assert: self typeWithNil isFunction not.
	self assert: self typeWithUnknown isFunction not.
	self assert: self typeWithUnknownAndNil isFunction not.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> isNamed [
	<gtExample>
	| type |
	type := self type.
	self assert: type isNamed.
	self assert: self typeWithNil isNamed not.
	self assert: self typeWithUnknown isNamed not.
	self assert: self typeWithUnknownAndNil isNamed not.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> isParametric [
	<gtExample>
	| type |
	type := self type.
	self assert: false description: 'add positive assertion'.
	self assert: type isParametric not.
	self assert: self typeWithNil isParametric not.
	self assert: self typeWithUnknown isParametric not.
	self assert: self typeWithUnknownAndNil isParametric not.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> isUnion [
	<gtExample>
	| type |
	type := self type.
	self assert: type isUnion.
	^ type
]

{ #category : #accessing }
TypUnionTypeExamples >> printOn [
	<gtExample>
	| type |
	type := self type.
	self assert: type asString = '{Integer}'.
	self assert: self typeWithNil asString = '{!Integer}'.
	self assert: self typeWithUnknown asString = '{?Integer}'.
	self assert: self typeWithUnknownAndNil asString = '{!?Integer}'.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> representsClassDescription [
	<gtExample>
	| type |
	type := self type.
	self assert: type representsClassDescription.
	self assert: self typeNotAClass representsClassDescription not.
	self assert: self typeObjectClass representsClassDescription.
	self assert: self typeTAssertable representsClassDescription.
	self
		assert: self typeTAssertableClassTrait representsClassDescription.
	^ type
]

{ #category : #testing }
TypUnionTypeExamples >> superType [
	<gtExample>
	| type |
	type := self type.
	self assert: type superType = self typeInteger.
	self
		assert:
			self typeWithNil superType
				=
					{self typeInteger.
					TypNilType instance} typAsType.
	self
		assert:
			self typeWithUnknown superType
				=
					{self typeInteger.
					TypUnknownType instance} typAsType.
	self
		assert:
			self typeWithUnknownAndNil superType
				=
					{self typeInteger.
					TypUnknownType instance.
					TypNilType instance} typAsType.
	self assert: self typeSmallIntegerAndTrue superType = self typeObject.
	self
		assert: [ self typeWithNil superType superType ]
		signals: TypNoTypeError.
	self
		assert: [ self typeWithUnknown superType superType ]
		signals: TypNoTypeError.
	self
		assert: [ self typeWithUnknownAndNil superType superType ]
		signals: TypNoTypeError.
	^ type
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> type [
	^ self typeLargePositiveIntegerAndSmallInteger
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeLargePositiveInteger [
	^ TypNamedType named: 'LargePositiveInteger'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeLargePositiveIntegerAndSmallInteger [
	^ TypUnionType
		types:
			{self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeSmallInteger [
	^ TypNamedType named: 'SmallInteger'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeSmallIntegerAndTrue [
	^ TypUnionType
		types:
			{self typeSmallInteger.
			self typeTrue}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeTrue [
	^ TypNamedType named: 'True'
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithNil [
	^ TypUnionType
		types:
			{TypNilType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithUnknown [
	^ TypUnionType
		types:
			{TypUnknownType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]

{ #category : #'as yet unclassified' }
TypUnionTypeExamples >> typeWithUnknownAndNil [
	^ TypUnionType
		types:
			{TypNilType instance.
			TypUnknownType instance.
			self typeLargePositiveInteger.
			self typeSmallInteger}
]