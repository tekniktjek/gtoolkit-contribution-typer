Class {
	#name : #TypShaPhaBehavior,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBehavior class >> shadowedClass [
	^ Behavior class
]

{ #category : #accessing }
TypShaPhaBehavior >> ___allSubclasses [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {Behavior typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compiledMethodAt: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___instVarNames [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {String typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBehavior >> ___lookupSelector: _a [
	^ TypMethodResolver new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methods [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Collection typAsType asParametricType: {CompiledMethod typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___selectors [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType asParametricType: {Symbol typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesClassVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Behavior typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesInstVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Behavior typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___withAllSuperclasses [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {Behavior typAsType} ];
		yourself
]