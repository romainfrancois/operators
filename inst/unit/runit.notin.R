
test.notin <- function( ){
	checkTrue( ! "aa" %!in% c("aa", "bb") , msg = "not in" )
	checkTrue( "aa" %!in% c("bb","cc") , msg = "in" )
}

test.without <- function(){
	checkEquals( c("A","B") %without% "A", "B", checkNames = FALSE, msg = "" )
  checkEquals( c("A","B") %without% "C", c("A","B") , checkNames = FALSE, msg = "" )
}

test.of <- function(){
	checkTrue( iris %of% "data.frame" , msg = "singel class" )
	checkTrue( glm(Sepal.Length~Species, data = iris) %of% "glm" , msg = "multiple classes" )
	checkTrue( glm(Sepal.Length~Species, data = iris) %of% "lm" , msg = "multiple classes" )
  checkTrue( glm %of% "function" , msg = "functions" )
	checkTrue( (x~y) %of% "formula" , msg = "formula" )
}


