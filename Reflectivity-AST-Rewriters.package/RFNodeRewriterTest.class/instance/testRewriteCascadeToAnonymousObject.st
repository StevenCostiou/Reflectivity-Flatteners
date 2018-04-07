rewriting - cascade
testRewriteCascadeToAnonymousObject

	|node links rewrite originalNode |
	node := exampleNodes cascadeToAnonObjectNode.
	originalNode := exampleNodes cascadeToAnonObjectNode.
	links := node propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	links add: after_link. 
	
	rewrite := RFNodeRewriter new rewriteCascadeNode: node.	
	
	self assert: rewrite size equals: 6.
	
	self assert: rewrite first isAssignment. 
	self assert: rewrite first variable equals: rewrite third receiver.
	self assert: rewrite first variable equals: rewrite fourth receiver.
	self assert: rewrite first variable equals: rewrite fifth receiver.
	self assert: rewrite first value equals: originalNode messages first receiver.
	
	self assert: rewrite second isMessage.	
	self assert: rewrite last isMessage.
	
	self assert: rewrite second receiver binding value == exampleNodes.	
	self assert: rewrite last receiver binding value == exampleNodes.
	
	self assert: rewrite second selector == #tag.
	self assert: rewrite last selector == #tag.	
	
	self assert: rewrite third selector equals: originalNode messages first selector.
	self assert: rewrite third arguments equals: originalNode messages first arguments.
	self assert: rewrite fourth selector equals: originalNode messages second selector.
	self assert: rewrite fourth arguments equals: originalNode messages second arguments.
	self assert: rewrite fifth selector equals: originalNode messages third selector.
	self assert: rewrite fifth arguments equals: originalNode messages third arguments.