Extension { #name : #Association }

{ #category : #'*Typer-Static-Pharo' }
Association class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters:
			{TypUnknownType instance.
			TypUnknownType instance};
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
Association class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #key;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a receiverType parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a receiverType parameters at: 2 ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]