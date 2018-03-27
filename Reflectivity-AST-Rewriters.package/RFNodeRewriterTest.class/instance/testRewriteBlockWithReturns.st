rewriting - blocks
testRewriteBlockWithReturns

	|node links rewrite originalNode argument|
	node := exampleNodes blockNodeWithReturns.
	originalNode := exampleNodes blockNodeWithReturns.
	
	links := (node allChildren detect:[:n| n isReturn]) propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: after_link. 

	rewrite := RFNodeRewriter new rewriteBlockNode: node.	
	
	self assert: rewrite size equals: 1.
	self assert: rewrite statements size equals: 2.
	
	self assert: rewrite statements first isAssignment.
	self assert: rewrite statements first value equals: originalNode statements first receiver.		
	self assert: rewrite statements first variable equals: rewrite statements second receiver .
	
	argument := rewrite statements second arguments first.
	self assert: argument statements first isAssignment .	
	self assert: argument statements first value equals: originalNode statements first arguments first statements last value.
	self assert: argument statements first variable equals: argument statements last value.		
		
	self assert: argument statements second receiver binding value == exampleNodes.
	self assert: argument statements second selector == #tag.
	