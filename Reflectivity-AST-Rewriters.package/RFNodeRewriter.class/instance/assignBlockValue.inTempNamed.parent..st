node generation
assignBlockValue: block inTempNamed: aTempName parent: parent
	| value |
	value := RBMessageNode receiver: block selector: #value.
	block parent: value.
	^self assignValue: value inTempNamed: aTempName parent: parent