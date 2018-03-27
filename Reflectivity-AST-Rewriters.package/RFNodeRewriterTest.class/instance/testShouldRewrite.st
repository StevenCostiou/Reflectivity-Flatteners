rewrite - authorization
testShouldRewrite
	| ast |
	ast := (ExampleNodes >> #exampleAssign) ast.
	
	self deny: (RFNodeRewriter new shouldRewrite: ast).
	
	ast link: before_link.
	self assert: (RFNodeRewriter new shouldRewrite: ast).
	
	before_link uninstall.
	ast allChildren atRandom link: before_link.
	self assert: (RFNodeRewriter new shouldRewrite: ast)