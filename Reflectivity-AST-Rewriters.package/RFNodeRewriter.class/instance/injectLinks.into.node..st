links
injectLinks: sortedLinks into: statements node: node
	| generator |
	generator := HookGenerator node: node.
	sortedLinks instead isEmpty
		ifFalse: [ statements removeAll.
			statements add: (generator hookFor: sortedLinks instead last) ].
	sortedLinks before do: [ :link | statements addFirst: (generator hookFor: link) ].
	sortedLinks after do: [ :link | statements add: (generator hookFor: link) ]