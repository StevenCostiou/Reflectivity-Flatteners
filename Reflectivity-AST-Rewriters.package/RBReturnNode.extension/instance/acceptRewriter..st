*Reflectivity-AST-Rewriters
acceptRewriter: rewriter
	(rewriter shouldRewrite: self)
		ifFalse: [ ^ super acceptRewriter: rewriter ].
	^ rewriter rewriteReturnNode: self