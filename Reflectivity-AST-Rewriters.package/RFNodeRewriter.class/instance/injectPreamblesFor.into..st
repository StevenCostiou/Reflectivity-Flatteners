preambles
injectPreamblesFor: node into: statements
	(self preamblesFor: node)
		do: [ :preamble | 
			temporaries add: preamble key.
			statements addFirst: preamble value ]