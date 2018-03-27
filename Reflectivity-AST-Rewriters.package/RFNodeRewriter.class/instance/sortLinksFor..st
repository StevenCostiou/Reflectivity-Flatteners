links
sortLinksFor: node
	| sortedLinks |
	sortedLinks := RFLinkSorter sortLinksFor: node.
	sortedLinks addLinks: node additionalAfterLinks control: #after.
	^ sortedLinks