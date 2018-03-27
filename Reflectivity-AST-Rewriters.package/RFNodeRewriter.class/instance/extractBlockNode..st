extracting
extractBlockNode: aBlockNode
	"Extracts a block node from a parent. 
	The parent of the new node is the parent of the original parent, because the node is moved one level up.
	The extracted block is rewriten if needed."

	| extractedBlock |
	aBlockNode acceptRewriter: self.
	aBlockNode hasReturns
		ifTrue: [ ^ OrderedCollection new ].
	extractedBlock := self assignBlockValue: aBlockNode inTempNamed: aBlockNode rewriteId parent: aBlockNode parent parent.
	^ OrderedCollection with: extractedBlock