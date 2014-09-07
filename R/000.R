# bring (a less efficient version of) grepl from the future
if( version$major > 2 | ( version$major == 2 && as.numeric(version$minor) >= 9) ){
	grepl <- function (pattern, x, ignore.case = FALSE, perl = FALSE, 
	    fixed = FALSE, useBytes = FALSE) {
		
		call <- match.call( )
		call[["text"]] <- call[["x"]]
		call[["x"]] <- NULL
		call[[1]] <- as.name( "regexpr" )
		rg.out <- eval.parent( call )
		rg.out > 0
	}
}

