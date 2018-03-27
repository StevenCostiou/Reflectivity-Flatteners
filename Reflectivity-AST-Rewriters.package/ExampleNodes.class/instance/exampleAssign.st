variables
exampleAssign
	| assign variable value |
	value := RBLiteralValueNode value: 'test'.
	variable := RBTemporaryNode named: 'temp'.
	assign := RBAssignmentNode variable: variable value: value.
	RFASTTagger new tagNode: assign.
	assign parent: (self class>>#exampleAssign) ast.
	^ assign