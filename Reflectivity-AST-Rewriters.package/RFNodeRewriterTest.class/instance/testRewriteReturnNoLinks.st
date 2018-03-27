rewriting - return
testRewriteReturnNoLinks
	| return rewrite |
	return := exampleNodes exampleReturn.
	rewrite := return acceptRewriter: RFNodeRewriter new.
	
	self assert: rewrite size equals: 1.
	self assert: rewrite first == return