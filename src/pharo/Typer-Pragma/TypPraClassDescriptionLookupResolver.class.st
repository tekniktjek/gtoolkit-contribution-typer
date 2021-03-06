Class {
	#name : #TypPraClassDescriptionLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraClassDescriptionLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypClassDescriptionLookupResult>'>
	^ aLookup classDescription typPraAsClassDescriptionLookupResult
		ifNil: [ #() ]
		ifNotNil: [ :e | 
			{(e
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself)} ]
]
