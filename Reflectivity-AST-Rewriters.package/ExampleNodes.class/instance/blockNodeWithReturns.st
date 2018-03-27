blocks
blockNodeWithReturns
	| node |
	node := (ExampleNodes >> #methodWithBlockWithReturn) ast statements first copy.
	RFASTTagger new tagNode: node.
	^ node