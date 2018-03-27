initialization
tagNode: node
	|id|
	id := node class name, '_', counter printString.
	node rewriteId: id.
	counter := counter + 1.
	node children do:[:child| self tagNode: child]