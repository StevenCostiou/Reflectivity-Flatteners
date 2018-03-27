deprecated
rewriteSequenceNode: node
	"Sequence nodes are always rewritten.
	Links cannot be put on them but on surrounding methods or blocks."

	| newSequence |
	temporaries addAll: node temporaries.
	newSequence := OrderedCollection new.
	node children do: [ :child | newSequence addAll: (child acceptRewriter: self) ].
	^ RBSequenceNode temporaries: temporaries statements: newSequence