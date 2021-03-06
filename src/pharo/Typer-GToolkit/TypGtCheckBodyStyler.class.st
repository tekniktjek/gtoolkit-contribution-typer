Class {
	#name : #TypGtCheckBodyStyler,
	#superclass : #GtASTStyler,
	#instVars : [
		'coder',
		'markUnknowns'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtCheckBodyStyler >> coder [
	^ coder
]

{ #category : #accessing }
TypGtCheckBodyStyler >> coder: anObject [
	coder := anObject
]

{ #category : #initialization }
TypGtCheckBodyStyler >> initialize [
	super initialize.
	markUnknowns := false
]

{ #category : #accessing }
TypGtCheckBodyStyler >> markUnknowns [
	^ markUnknowns
]

{ #category : #accessing }
TypGtCheckBodyStyler >> markUnknowns: anObject [
	markUnknowns := anObject
]

{ #category : #styling }
TypGtCheckBodyStyler >> style: aText ast: anAst [
	anAst
		typType;
		typTypeReset;
		typType.
	super style: aText ast: anAst
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleFrom: anInteger to: anotherInteger color: aColor [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Integer'>
	<typTypeArgument: 3 as: 'Color'>
	self
		styleFrom: anInteger
		to: anotherInteger
		with:
			{(BlTextUnderlineAttribute new
				paint: (aColor alpha: 0.5);
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode color: aColor [
	<typTypeArgument: 1 as: 'RBProgramNode'>
	<typTypeArgument: 2 as: 'Color'>
	self styleFrom: aNode start to: aNode stop color: aColor
]

{ #category : #accessing }
TypGtCheckBodyStyler >> styleSelectorOf: aNode color: aColor [
	<typTypeArgument: 1 as: '{RBMethodNode,RBMessageNode}'>
	<typTypeArgument: 2 as: 'Color'>
	aNode keywordsIntervals
		do: [ :e | self styleFrom: e first to: e last color: aColor ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	aNode typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	aNode value typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode value color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility ]
				on: TypCheError
				do: [ :e | self styleNode: aNode value color: e color ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	aNode receiver typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckMethod.
			aNode typCheCheckReceiver ]
				on: TypCheError
				do: [ :e | self styleSelectorOf: aNode color: e color ] ].
	aNode arguments
		withIndexDo: [ :e :i | 
			(e typType isUnknown or: [ (aNode typTypeForArgumentAt: i) isUnknown ])
				ifTrue: [ markUnknowns ifTrue: [ self styleNode: e color: Color blue ] ]
				ifFalse: [ [ aNode typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheError
						do: [ :f | self styleNode: e color: f color ] ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMethodNode: aNode [
	| position node |
	super visitMethodNode: aNode.
	node := aNode == coder rbAST
		ifTrue: [ aNode ]
		ifFalse: [ coder rbAST
				typType;
				typTypeReset;
				typType;
				yourself ].
	node typCheHasUnknownResult
		ifTrue: [ markUnknowns
				ifTrue: [ self styleSelectorOf: node color: Color blue ] ].
	position := node arguments isEmpty
		ifTrue: [ node selector size ]
		ifFalse: [ node arguments last stop ].
	self
		styleFrom: position
		to: position
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ BlElement new
						background: node typCheColor;
						constraintsDo: [ :c | 
							c horizontal exact: 16.	"typCastAs BlLayoutCommonConstraintsAxis"
							c vertical exact: 16	"typCastAs BlLayoutCommonConstraintsAxis" ];
						margin:
							(BlInsets
								top: 0
								right: 2
								bottom: 0
								left: 2);
						yourself ];
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	aNode typType isUnknown
		ifTrue: [ markUnknowns
				ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility.
			aNode typCheCheckNullables ]
				on: TypCheError
				do: [ :e | self styleNode: aNode color: e color ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	(aNode typIsDeclaration and: [ aNode typType isUnknown ])
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
]
