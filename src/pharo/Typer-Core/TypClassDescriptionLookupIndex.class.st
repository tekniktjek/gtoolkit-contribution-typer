Class {
	#name : #TypClassDescriptionLookupIndex,
	#superclass : #TypLookupIndex,
	#instVars : [
		'index'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypClassDescriptionLookupIndex class >> instance [
	<typTypeResultAs: 'TypClassDescriptionLookupIndex'>
	^ instance
		ifNil: [ instance := self new
				resolver:
					(TypCachingLookupResolver new
						resolver:
							(TypBreadthLookupResolver new
								resolvers:
									{(TypDepthLookupResolver new
										resolver:
											(TypBreadthLookupResolver new
												resolvers:
													{TypPraClassDescriptionLookupResolver new.
													TypShaClassDescriptionLookupResolver new};
												yourself);
										yourself).
									(TypDepthLookupResolver new
										resolver: TypInfClassDescriptionLookupResolver new;
										yourself)};
								yourself);
						yourself);
				yourself ]
]

{ #category : #initialization }
TypClassDescriptionLookupIndex >> initialize [
	<typTypeVariable: 'index' as: 'IdentityDictionary<Symbol,TypType>'>
	super initialize.
	index := IdentityDictionary new
]

{ #category : #initialization }
TypClassDescriptionLookupIndex >> reset [
	super reset.
	index removeAll
]

{ #category : #accessing }
TypClassDescriptionLookupIndex >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	^ (index
		at: aLookup classDescription name asSymbol
		ifAbsentPut: [ ((resolver resolve: aLookup) "typParameters TypClassDescriptionLookupResult")
				detect: [ :e
					 | 
					[ | type |
					type := e type.
					type isUnknown not ]
						on: Error
						do: [ :f |
							f emit.
							self flag: 'FIXME signal?'.
							false ] ]
				ifFound: #type
				ifNone: [ TypUnknownType instance ] ])
]
