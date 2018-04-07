rewriting
rewriteCascadeNode: node
	| statements receiver tempReceiver |
	statements := OrderedCollection new.
	(self shouldRewrite: node)
		ifFalse: [ ^ OrderedCollection with: node ].
	receiver := node messages first receiver.
	tempReceiver := self assignValue: receiver inTempNamed: receiver rewriteId parent: node parent.
	node messages
		do: [ :msgNode | 
			| copyNode |
			copyNode := msgNode copy.
			copyNode receiver: tempReceiver variable.
			statements addAll: (copyNode acceptRewriter: self) ].
	self injectLinksFor: node into: statements.
	statements addFirst: tempReceiver.
	^ statements