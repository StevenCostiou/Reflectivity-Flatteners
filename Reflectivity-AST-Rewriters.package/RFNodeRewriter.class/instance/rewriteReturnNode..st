rewriting
rewriteReturnNode: node
	| statements sortedLinks |
	sortedLinks := self sortLinksFor: node.
	statements := OrderedCollection new.
	statements
		add: (self assignValue: node value inTempNamed: node rewriteId parent: node parent).
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements.
	sortedLinks instead
		ifEmpty: [ statements
				add: (self returnValue: (self temporaryNamed: node rewriteId) parent: node parent) ].
	^ statements