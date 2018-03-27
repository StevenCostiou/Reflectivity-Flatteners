rewriting - method
testRewriteMethodNodeInstead
	
	|node links rewrite|
	node := exampleNodes methodNodeNoReturn.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: instead_link.
	
	rewrite := RFNodeRewriter new rewriteMethodNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 1.
	self assert: rewrite statements first isMessage.	
	self assert: rewrite statements first receiver binding value == exampleNodes.
	self assert: rewrite statements first selector == #tag.
	