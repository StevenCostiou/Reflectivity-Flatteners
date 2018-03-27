extracting
extractNode: anRBProgramNode
	"Extracts a node from a parent. The parent of the new node is the parent of the original parent, because the node is moved one level up.
	The extracted node is rewriten if needed."
	| statements extractedNode |
	statements := OrderedCollection new.
	extractedNode := self
		assignValue: anRBProgramNode
		inTempNamed: anRBProgramNode rewriteId
		parent: anRBProgramNode parent parent.
	statements addAll: (extractedNode acceptRewriter: self).
	^ statements