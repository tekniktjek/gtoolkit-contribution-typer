Class {
	#name : #TypNamedType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'representsClass',
		'classDescription'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypNamedType class >> classDescription: aClassDescription [
	^ self new
		classDescription: aClassDescription;
		yourself
]

{ #category : #'instance creation' }
TypNamedType class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #comparing }
TypNamedType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | type |
					type := anObject "typCastAs TypNamedType".
					self name = type name ] ]
]

{ #category : #comparing }
TypNamedType >> > aType [
	^ self ~= aType and: [ aType isNamed and: [ self representsClassDescription and: [ aType representsClassDescription and: [ aType classDescription typIncludesBehavior: self classDescription ] ] ] ]
]

{ #category : #converting }
TypNamedType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	^ TypFunctionType new
		name: name;
		classDescription: classDescription;
		parameters: someTypes;
		result: aType;
		optionalParameters: aBoolean;
		yourself
]

{ #category : #converting }
TypNamedType >> asNamedType [
	^ self
]

{ #category : #converting }
TypNamedType >> asParametricType: someTypes [
	^ TypParametricType new
		name: name;
		classDescription: classDescription;
		parameters: someTypes;
		yourself
]

{ #category : #converting }
TypNamedType >> classDescription [
	self flag: 'FIXME invalidate?'.
	self assert: [ self representsClassDescription ].
	^ classDescription
		ifNil: [ classDescription := (name endsWith: ' class')
				ifTrue: [ (name copyFrom: 1 to: name size - ' class' size) asClass classSide ]
				ifFalse: [ (name endsWith: ' classTrait')
						ifTrue: [ (name copyFrom: 1 to: name size - ' classTrait' size) asClass
								classSide ]
						ifFalse: [ name asClass ] ] ]
]

{ #category : #accessing }
TypNamedType >> classDescription: aClassDescription [
	classDescription := aClassDescription.
	classDescription
		ifNil: [ representsClass := nil ]
		ifNotNil: [ name := classDescription name.
			representsClass := true ]
]

{ #category : #'as yet unclassified' }
TypNamedType >> hasSuperType [
	^ self representsClassDescription and: [ self classDescription superclass isNotNil ]
]

{ #category : #comparing }
TypNamedType >> hash [
	^ name hash
]

{ #category : #initialization }
TypNamedType >> initialize [
	<typTypeVariable: 'name' as: 'String<Character>'>
	<typTypeVariable: 'representsClass' as: '!Boolean'>
	super initialize.
	representsClass := nil
]

{ #category : #testing }
TypNamedType >> isNamed [
	^ true
]

{ #category : #'as yet unclassified' }
TypNamedType >> lookupSelector: aSymbol [
	^ self representsClassDescription
		ifTrue: [ (self classDescription lookupSelector: aSymbol)
				ifNil: [ Set new ]
				ifNotNil: [ :e | Set with: e ] ]
		ifFalse: [ Set new ]
]

{ #category : #accessing }
TypNamedType >> name [
	<typTypeResultAs: 'String<Character>'>
	^ name
]

{ #category : #accessing }
TypNamedType >> name: anObject [
	<typTypeArgument: 1 as: 'String<Character>'>
	name := anObject.
	representsClass := nil
]

{ #category : #printing }
TypNamedType >> printOn: aStream [
	aStream << name asString
]

{ #category : #testing }
TypNamedType >> representsClassDescription [
	self flag: 'FIXME invalidate?'.
	^ representsClass
		ifNil: [ | clazz_ |
			clazz_ := name.
			(clazz_ endsWith: ' class')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' class' size ].
			(clazz_ endsWith: ' classTrait')
				ifTrue: [ clazz_ := name copyFrom: 1 to: name size - ' classTrait' size ].
			representsClass := [ clazz_ asClass.
			true ]
				on: NotFound
				do: [ false ] ]
]

{ #category : #'as yet unclassified' }
TypNamedType >> superType [
	self assert: [ self hasSuperType ].
	^ self classDescription superclass typAsType
]