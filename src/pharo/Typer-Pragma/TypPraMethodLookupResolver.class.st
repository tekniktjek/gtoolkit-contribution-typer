Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			(e classDescription typPraAsMethodLookupResultFor: aLookup selector)
				ifNil: [ #() ]
				ifNotNil: [ :f | 
					{(f
						lookup: aLookup;
						resolvedBy: aLookup;
						resolver: self;
						yourself)} ] ]
]
