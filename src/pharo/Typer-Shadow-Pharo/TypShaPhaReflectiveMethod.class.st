Class {
	#name : #TypShaPhaReflectiveMethod,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaReflectiveMethod class >> shadowedClass [
	^ ReflectiveMethod class
]

{ #category : #accessing }
TypShaPhaReflectiveMethod >> ___compiledMethod [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]
