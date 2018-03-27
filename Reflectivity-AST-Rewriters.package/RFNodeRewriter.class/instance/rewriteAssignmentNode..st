rewriting
rewriteAssignmentNode: node
	| statements sortedLinks |
	(self shouldRewrite: node value)
		ifFalse: [ ^ OrderedCollection with: node ].
	sortedLinks := self sortLinksFor: node.
	statements := OrderedCollection new.

	"Variables are not rewritten for assignments"
	node value isVariable
		ifTrue: [ statements add: node.
			self injectLinks: sortedLinks into: statements node: node.
			self injectPreamblesFor: node into: statements.
			^ statements ].		
	
	"Other nodes can be rewritten"	
	statements addAll: (node value acceptRewriter: self).
	node value: (self temporaryNamed: node value rewriteId).

	"Links injection"
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements.
	^ statements