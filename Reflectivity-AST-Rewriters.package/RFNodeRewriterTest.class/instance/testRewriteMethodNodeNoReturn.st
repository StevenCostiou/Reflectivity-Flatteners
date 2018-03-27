rewriting - method
testRewriteMethodNodeNoReturn

	|node links rewrite originalNode |
	node := exampleNodes methodNodeNoReturn.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	
	rewrite := RFNodeRewriter new rewriteMethodNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 2.
	self assert: rewrite statements first isMessage.	
	self assert: rewrite statements first receiver binding value == exampleNodes.
	self assert: rewrite statements first selector == #tag.
	
	originalNode := exampleNodes methodNodeNoReturn.
	self assert: rewrite statements second equals: originalNode statements first