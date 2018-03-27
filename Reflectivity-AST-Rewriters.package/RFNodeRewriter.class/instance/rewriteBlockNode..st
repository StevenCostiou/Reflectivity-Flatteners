rewriting
rewriteBlockNode: node
	| blockNodeRewriter statements sortedLinks |
	blockNodeRewriter := self class new.
	(self shouldRewrite: node)
		ifFalse: [ ^ OrderedCollection with: node ].
	sortedLinks := self sortLinksFor: node.
	statements := node body children
		flatCollect: [ :child | child acceptRewriter: blockNodeRewriter ].
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements.
	node body: (RBSequenceNode temporaries: temporaries values statements: statements).
	^ node