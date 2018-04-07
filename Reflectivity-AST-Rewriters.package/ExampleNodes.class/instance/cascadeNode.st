cascades
cascadeNode
	| node |
	node := (self class >> #methodWithCascade) ast statements second copy.
	RFASTTagger new tagNode: node.
	^ node