
test.patternRemoving <- function(){
  
  cols <- c( "blue", "red" )
  res <- cols %-~% "e"
  checkEquals( length(res) , 2 , checkNames = FALSE, msg = "%-~% (1)" )
  checkEquals( res , c("blu", "rd") , checkNames = FALSE, msg = "%-~% (2)" )
  
  res <- cols %-~% "pp"
  checkEquals( cols , res , checkNames = FALSE, msg = "%-~% no match (3)" )
  
  res <- cols %-~% "blue"
  checkEquals( res , c( "", "red"), checkNames = FALSE, msg = "%-~% no match (4)" )
  
}

test.patternFilterAndRemove <- function( ){
  cols <- c( "blue", "red" )
  res <- cols %-~|% "b"
  checkEquals( res , "lue"  , checkNames = FALSE, msg = "" )
  
  res <- cols %-~|% "e"
  checkEquals( res , c("blu", "rd" ) , checkNames = FALSE, msg = "" )
  
}

test.ogrep <- function() {
  cols <- c( "blue.col", "pink", "red.stuff" )
  res <- cols %o~|% "\\..*$"
  checkEquals( length(res) , 2 , checkNames = FALSE, msg = "" )
  checkEquals( res[1] , ".col"  , checkNames = FALSE, msg = "" )
  checkEquals( res[2] , ".stuff"  , checkNames = FALSE, msg = "" )
  
  res <- cols %o~|% "\\.(.*)$"
  checkEquals( length(res) , 2 , checkNames = FALSE, msg = "" )
  checkEquals( res[1] , "col"  , checkNames = FALSE, msg = "" )
  checkEquals( res[2] , "stuff"  , checkNames = FALSE, msg = "" )
}

