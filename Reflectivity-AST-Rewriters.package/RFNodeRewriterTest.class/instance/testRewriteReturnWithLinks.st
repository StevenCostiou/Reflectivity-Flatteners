rewriting - return
testRewriteReturnWithLinks
	| return links rewrite |
	return := exampleNodes exampleReturn.
	
	links := return propertyAt: #links ifAbsentPut: [ OrderedCollection new ].
	links add: before_link.
	links add: after_link.
	
	rewrite := return acceptRewriter: RFNodeRewriter new.
	
	self assert: rewrite size equals: 4.
	
	self assert: rewrite first isMessage.
	self assert: rewrite first receiver binding value == exampleNodes.
	self assert: rewrite first selector == #tag.
	
	self assert: rewrite third isMessage.
	self assert: rewrite third receiver binding value == exampleNodes.
	self assert: rewrite third selector == #tag.
	
	self assert: rewrite second isAssignment.
	self assert: rewrite second variable name == return rewriteId.
	self assert: rewrite second value == return value.	
	
	self assert: rewrite last isReturn.
	self assert: rewrite last value name == return rewriteId.
