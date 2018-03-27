running
setUp
	super setUp.
	exampleNodes := ExampleNodes new.
	before_link := MetaLink new metaObject: exampleNodes; selector: #tag; control: #before; yourself.
	after_link := MetaLink new metaObject: exampleNodes; selector: #tag; control: #after; yourself.
	instead_link := MetaLink new metaObject: exampleNodes; selector: #tag; control: #instead; yourself.