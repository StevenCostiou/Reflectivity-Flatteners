returns
methodNodeWithReturns
	| node |
	node := (self class >> #methodWithReturn:) ast copy.
	RFASTTagger new tagNode: node.
	^ node