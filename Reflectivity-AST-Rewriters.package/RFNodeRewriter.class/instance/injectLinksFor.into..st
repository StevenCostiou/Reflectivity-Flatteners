links
injectLinksFor: node into: statements
	| sortedLinks |
	sortedLinks := self sortLinksFor: node.
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements