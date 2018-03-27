asserting
shouldRewriteNode: node
	^ node hasLinks or: [ node additionalAfterLinks notEmpty ]