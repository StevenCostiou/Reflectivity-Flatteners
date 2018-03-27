methods
methodWithReturn: bool
	|j|
	j := 1.
	bool ifTrue:[^j + 5].
	j := j + 4.
	^j
	
	