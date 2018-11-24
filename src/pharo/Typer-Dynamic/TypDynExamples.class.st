Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	| methods collector testResult |
	methods := #'Neo-JSON-Core' asPackage methods.
	collector := TypDynTypeCollector new.
	testResult := TestResult new.
	collector
		collectAll: methods
		doing: [ (#'Neo-JSON-Tests' asPackage definedClasses select: [ :e | e isTestCase and: e isAbstract not ]) do: [ :e | e suite run: testResult ] ].
	^ testResult -> collector
]