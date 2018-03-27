rewriting - method
testRewriteMethodNodeWithReturn
	"We specifically test that all returns nodes are correcly wrapped inside a method"

	|node links rewrite originalNode returnNode tag |
	node := exampleNodes methodNodeWithReturns.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	links add: after_link.
	
	rewrite := RFNodeRewriter new rewriteMethodNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 8.
	self assert: rewrite statements first isMessage.	
	self assert: rewrite statements first receiver binding value == exampleNodes.
	self assert: rewrite statements first selector == #tag.
	
	originalNode := exampleNodes methodNodeWithReturns.
	self assert: rewrite statements second equals: originalNode statements first.
	
	"Embedded return in argument block node must be wrapped"
	self assert: (rewrite statements at: 4) arguments first statements first isAssignment.
	returnNode := (rewrite statements at: 4) arguments first statements first value.
	self assert: returnNode equals: originalNode statements second arguments first statements last value.
	tag := (rewrite statements at: 4) arguments first statements at: 2.	
	self assert: tag isMessage.
	self assert: tag receiver binding value == exampleNodes.
	self assert: tag selector == #tag.
	self assert: (rewrite statements at: 4) arguments first statements last isReturn.
	self assert: (rewrite statements at: 4) arguments first statements last value equals: (rewrite statements at: 4) arguments first statements first variable.
	
	"Return at the end of the method must be wrapped"
	self assert: (rewrite statements at: 6) isAssignment.
	returnNode := (rewrite statements at: 6) value.
	self assert: returnNode equals: originalNode statements last value.
	tag := (rewrite statements at: 7).	
	self assert: tag isMessage.
	self assert: tag receiver binding value == exampleNodes.
	self assert: tag selector == #tag.
	self assert: (rewrite statements at: 8)  isReturn.
	self assert: (rewrite statements at: 8) value equals: (rewrite statements at: 6) variable.
	








