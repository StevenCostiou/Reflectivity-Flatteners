rewriting
rewriteMessageNode: node
	| statements sortedLinks newArgs |
	(self shouldRewrite: node)
		ifFalse: [ ^ OrderedCollection with: node ].
	sortedLinks := self sortLinksFor: node.
	statements := OrderedCollection new.

	"Receiver rewriting"
	statements add: (self assignValue: node receiver inTempNamed: node receiver rewriteId parent: node parent).
	node receiver: (self temporaryNamed: node receiver rewriteId).

	"Arguments rewriting"
	newArgs := OrderedCollection new.
	node arguments
		do: [ :argNode | 
			| extractedArg |
			extractedArg := (self shouldExtract: argNode)
				ifTrue: [ self temporaryNamed: argNode rewriteId ]
				ifFalse: [ argNode ].
			newArgs add: extractedArg.
			statements addAll: (argNode acceptRewriteExtractor: self) ].
	statements add: node.

	"Links injection"
	self injectLinks: sortedLinks into: statements node: node.
	self injectPreamblesFor: node into: statements.
	^ statements