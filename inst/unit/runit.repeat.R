
test.repeat <- function(){
	checkEquals( "--" %x=% 10, paste(rep("-", 20), collapse = "") , msg = "", checkNames = FALSE )
  checkEquals( "-+" %x=% 10, paste(rep("-+", 10), collapse = ""), checkNames = FALSE, msg = "" )
	
	checkEquals( nchar("--" %x=|% 50), 50 , msg = "", checkNames = FALSE )
	checkEquals( nchar("|-<+>-|" %x=|% 50), 50 , msg = "", checkNames = FALSE )
	checkEquals( "|-<+>-|" %x=|% 50, substring(paste(rep("|-<+>-|", 10), collapse = "" ), 0, 50) , msg = "", checkNames = FALSE )
	
	
}

test.repeat.zero <- function(){
	
}



