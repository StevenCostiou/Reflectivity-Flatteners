asserting
shouldRewrite: node
	^(self shouldRewriteNode: node) or:[self shouldRewriteChildrenOf: node]