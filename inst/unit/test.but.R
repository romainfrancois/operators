
test.but_default <- function( ){
	checkEquals( rnorm %but% glm , rnorm, msg = "default behaviour of %but%" )
}

test.but_list <- function(){
	grep. <- grep %but% list( perl = FALSE, pattern = "foobar" )
	f <- formals( grep. )
	checkEquals( f$pattern , "foobar", msg = "list %but%" )
	checkEquals( f$perl , FALSE, msg = "list %but%" )
	
	grep. <- grep %but% list( foo = "bar" )
	f <- formals( grep. )
	checkTrue( "foo" %!in% names(f) , msg = "" )
}

test.but_character <- function(){
	checkTrue( formals( grep %but% "+p" ) $perl , msg = "" )
	checkTrue( formals( grep %but% "!p" ) $perl , msg = "" )
	checkTrue( ! formals( grep %but% "-p" ) $perl , msg = "" )
	
	checkTrue( formals( grep %but% "pf" )$fixed , msg = "" )
	checkTrue( ! formals( grep %but% "p-f" )$fixed , msg = "" )
	checkTrue( ! formals( grep %but% "p!f" )$fixed , msg = "" )
	
	old.op <- options( warn = 2)
	test <- try( grep %but% "a", silent = TRUE )
	checkEquals( class(test), "try-error" , checkNames = FALSE, msg = "" )
	options( old.op )
	
}

