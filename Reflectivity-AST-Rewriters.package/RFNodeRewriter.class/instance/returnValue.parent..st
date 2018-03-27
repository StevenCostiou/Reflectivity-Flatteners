node generation
returnValue: value parent: parent
	| return |
	return := RBReturnNode value: value.
	return parent: parent.
	^ return