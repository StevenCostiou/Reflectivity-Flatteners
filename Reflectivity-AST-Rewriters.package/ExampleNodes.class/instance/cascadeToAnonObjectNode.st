cascades
cascadeToAnonObjectNode
	| node |
	node := (self class >> #methodWithCascadeInReturn) ast statements first value copy.
	RFASTTagger new tagNode: node.
	^ node