rewriting - method
testRewriteMethodNodeNoLinks
	|node rewrite originalNode|
	node := exampleNodes methodNodeNoReturn.
	rewrite := RFNodeRewriter new rewriteMethodNode: node.
	
	self assert: rewrite size equals: 1.
	self assert: rewrite first == node.
	
	originalNode := exampleNodes methodNodeNoReturn. 
	self assert: rewrite first body equals: originalNode body