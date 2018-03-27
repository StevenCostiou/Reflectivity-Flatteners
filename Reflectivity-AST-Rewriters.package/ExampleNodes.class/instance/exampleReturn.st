variables
exampleReturn
	| return value |
	value := RBLiteralValueNode value: 'return'.
	return := RBReturnNode value: value.
	RFASTTagger new tagNode: return.
	return parent: (self class>>#exampleReturn) ast.
	^ return