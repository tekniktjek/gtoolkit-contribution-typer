Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfMethodResolverIndex [
	^ (self methods
		select: [ :e | e isAbstract not and: [ e ast isPrimitive not ] ])
		flatCollect: #typInfMethodResolverIndex
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfTypeResolverIndex [
	^ {(self name
		->
			{(TypTypeResolver new
				type: [ :a | a clazz typAsNamedType ];
				yourself)})}
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfVariableResolverIndex [
	^ self class instVarNames
		collect: [ :e | 
			| definer clazzes type |
			definer := self class whichClassDefinesInstVar: e.
			clazzes := self class typInfWithAllSuperclassesUntil: definer.
			self
				flag:
					'this might also catch overridden methods, making it not completely sound'.
			type := (clazzes
				flatCollect: [ :f | 
					f methods
						flatCollect: [ :g | 
							(g assignmentNodes select: [ :h | h variable name = e ])
								collect: [ :h | h value typType ] ] ]) typAsType.
			self name -> e
				->
					{(TypVariableResolver new
						type: [ type ];
						yourself)} ]
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfWithAllSuperclassesUntil: anotherClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<ClassDescription>'>
	| clazzes |
	clazzes := self withAllSuperclasses.
	^ clazzes copyFrom: 1 to: (clazzes indexOf: anotherClass)
]