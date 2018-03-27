*Reflectivity-AST-Rewriters
hasReturns
	^ self body children anySatisfy: [ :child | child isReturn ]