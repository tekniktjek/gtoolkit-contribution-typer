Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssign: anObject [
	| value_ |
	value_ := anObject class typAsType.
	self typDynMonitor critical: [ self typDynAssigns increment: value_ ]
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssigns [
	^ self propertyAt: #typDynAssigns ifAbsentPut: [ TypDynTypes new ]
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynUninstall [
	super typDynUninstall.
	self removeProperty: #typDynAssigns ifAbsent: [  ]
]