Extension { #name : #Class }

{ #category : #'*Typer-Shadow' }
Class >> typShaShadows [
	^ ((TypShaShadow allSubclasses collect: #instance)
		select: [ :e | e shadowedClass == self ])
		sorted: [ :a :b | a priority > b priority ]
]
