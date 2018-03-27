sorting
sortLinksFor: node
	node hasLinks
		ifFalse: [ ^ self ].
	self before: node beforeLinks.
	self instead: node insteadLinks.
	self after: node afterLinks.
	node isMethod
		ifTrue: [ (node allChildren select: [ :child | child isReturn ]) do: [ :return | return additionalAfterLinks: self after ].
			node body children last isReturn
				ifTrue: [ self after: #() ] ].
	^ self