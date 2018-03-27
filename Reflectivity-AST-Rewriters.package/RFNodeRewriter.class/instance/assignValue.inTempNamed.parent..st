node generation
assignValue: value inTempNamed: aTempName parent: parent
	| temp assignment |
	temp := self temporaryNamed: aTempName.
	assignment := RBAssignmentNode variable: temp value: value.
	assignment parent: parent.
	^ assignment