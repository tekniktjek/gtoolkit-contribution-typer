Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypLookupResult>'>
	self subclassResponsibility
]
