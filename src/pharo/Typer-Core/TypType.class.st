Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'superType'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypType >> < aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType >= self
]

{ #category : #comparing }
TypType >> > aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]

{ #category : #comparing }
TypType >> >= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self = aType or: [ self > aType ]
]

{ #category : #converting }
TypType >> asCollection [
	<typTypeResultAs: 'Collection<TypType>'>
	^ { self }
]

{ #category : #converting }
TypType >> asCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	aType isTypeVariable
		ifTrue: [ ^ aType ].
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullableType ].
	self >= aType
		ifTrue: [ ^ self ].
	self hasSuperType
		ifTrue: [ ^ self superType asCompatibleWith: aType ].
	^ TypUnknownType instance
]

{ #category : #converting }
TypType >> asNonNullableType [
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullableType [
	<typTypeResultAs: 'TypType'>
	^ {TypNilType instance.
	self} typAsType
]

{ #category : #converting }
TypType >> asUnionType [
	<typTypeResultAs: 'TypUnionType'>
	^ TypUnionType types: {self}
]

{ #category : #testing }
TypType >> canUnderstand: aSymbol [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]

{ #category : #testing }
TypType >> hasSuperType [
	^ superType isNotNil
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'superType' as: '{!,TypType}'>
	super initialize
]

{ #category : #testing }
TypType >> isFunction [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNullable [
	^ self isNil
]

{ #category : #testing }
TypType >> isParametric [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isTypeVariable [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnion [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isVoidType [
	^ false
]

{ #category : #accessing }
TypType >> lookupSelector: aSymbol [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeResultAs: 'IdentitySet<CompiledMethod>'>
	self subclassResponsibility
]

{ #category : #copying }
TypType >> postCopy [
	super postCopy.
	superType := superType copy
]

{ #category : #printing }
TypType >> printOn: aStream [
	self printOn: aStream skipping: Set new
]

{ #category : #printing }
TypType >> printOn: aStream skipping: aSet [
	"Respects skipping set to not print recursive type infinitely."

	self subclassResponsibility
]

{ #category : #accessing }
TypType >> resolveIn: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #accessing }
TypType >> superType [
	<typTypeResultAs: 'TypType'>
	self assert: [ self hasSuperType ].
	^ superType "typCastAs TypType"
]

{ #category : #accessing }
TypType >> superType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	superType := aType
]
