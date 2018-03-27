rewriting
rewriteMethodNode: node
	| statements sortedLinks |
	(self shouldRewrite: node)
		ifFalse: [ ^ OrderedCollection with: node ].
	methodNode := node.
	sortedLinks := self sortLinksFor: node.
	statements := node statements flatCollect: [ :child | child acceptRewriter: self ].
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements.
	node body: (RBSequenceNode temporaries: temporaries values statements: statements).
	^ node