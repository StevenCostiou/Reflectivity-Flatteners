rewriting - blocks
testRewriteBlockNoReturn

	|node links rewrite originalNode |
	node := exampleNodes blockNodeNoReturns.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	links add: after_link. 
	
	rewrite := RFNodeRewriter new rewriteBlockNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 3.
	
	self assert: rewrite statements first isMessage.	
	self assert: rewrite statements last isMessage.
	
	self assert: rewrite statements first receiver binding value == exampleNodes.	
	self assert: rewrite statements last receiver binding value == exampleNodes.
	
	self assert: rewrite statements first selector == #tag.
	self assert: rewrite statements last selector == #tag.
	
	originalNode := exampleNodes blockNodeNoReturns.
	self assert: rewrite statements second equals: originalNode statements first