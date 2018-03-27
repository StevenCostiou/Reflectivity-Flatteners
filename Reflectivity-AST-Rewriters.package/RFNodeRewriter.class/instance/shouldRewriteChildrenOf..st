asserting
shouldRewriteChildrenOf: node
	| children |
	children := node allChildren.
	^ children notEmpty and: [ children anySatisfy: [ :child | self shouldRewriteNode: child ] ]