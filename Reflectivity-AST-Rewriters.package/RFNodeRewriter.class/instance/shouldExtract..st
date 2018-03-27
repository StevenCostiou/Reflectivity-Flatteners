extracting
shouldExtract: node
	^ node isBlock not or: [ node hasReturns not ]