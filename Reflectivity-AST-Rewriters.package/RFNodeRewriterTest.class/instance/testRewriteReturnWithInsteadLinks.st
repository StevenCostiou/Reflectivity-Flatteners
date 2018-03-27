rewriting - return
testRewriteReturnWithInsteadLinks
	| return links rewrite |
	return := exampleNodes exampleReturn.
	
	links := return propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: instead_link.
	
	rewrite := return acceptRewriter: RFNodeRewriter new.
	
	self assert: rewrite size equals: 1.
	
	self assert: rewrite first isMessage.
	self assert: rewrite first receiver binding value == exampleNodes.
	self assert: rewrite first selector == #tag.