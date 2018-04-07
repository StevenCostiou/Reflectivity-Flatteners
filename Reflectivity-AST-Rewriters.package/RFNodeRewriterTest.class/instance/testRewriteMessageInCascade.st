rewriting - cascade
testRewriteMessageInCascade

	"|node links rewrite originalNode |
	node := exampleNodes cascadeNode.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	links add: after_link. 
	
	rewrite := RFNodeRewriter new rewriteCascadeNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 3.
	
	self assert: rewrite statements first isMessage.	
	self assert: rewrite statements last isMessage.
	
	self assert: rewrite statements first receiver binding value == exampleNodes.	
	self assert: rewrite statements last receiver binding value == exampleNodes.
	
	self assert: rewrite statements first selector == #tag.
	self assert: rewrite statements last selector == #tag.
	
	originalNode := exampleNodes blockNodeNoReturns.
	self assert: rewrite statements second equals: originalNode statements first"