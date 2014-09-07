

test.match <- function( ){
  
  blue <- rep( "blue" , 10 )
  res  <- blue %~% "^b" 
  checkTrue( all(res) , msg = "simple pattern matchin" )
  checkEquals( length(res) , 10  , checkNames = FALSE, msg = "simple pattern matchin length" )
  
  cols <- c("blue", "red" )
  res <- cols %~% "^b"
  checkTrue( res[1] , msg = "simple pattern matchin (2)" )
  checkTrue( !res[2] , msg = "simple pattern matching (3)" )
   
}

test.nomatch <- function(){

  cols <- c("blue", "red" )
  res <- cols %!~% "^b"
  checkTrue( !res[1] , msg = "%!~% (1)" )
  checkTrue( res[2] , msg = "%!~% (2)" )
  
}


test.rxfilter <- function(){
  cols <- c("blue", "red")
  res <- cols %~|% "^b" 
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "rx filter (1)" )
  checkEquals( res , "blue" , checkNames = FALSE, msg = "rx filter (2)" )
  
  res <- cols %~|% "f"
  checkEquals( length(res) , 0 , checkNames = FALSE, msg = "rx filter (3) - no match" )
  
}


test.norxfilter <- function(){
  cols <- c("blue", "red")
  res <- cols %!~|% "^b" 
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "rx no filter (1)" )
  checkEquals( res , "red" , checkNames = FALSE, msg = "rx no filter (2)" )
  
  res <- cols %!~|% "f"
  checkEquals( length(res) , 2 , checkNames = FALSE, msg = "rx no filter (3) - all match" )
  checkEquals( res , cols , checkNames = FALSE, msg = "" )
  
}


test.allmatch <- function( ){
  # all match
  cols <- c("red", "blue" )
  res <- cols %~*% "e"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "all match (1)" )
  checkTrue( res , msg = "all match (2)" )
  
  # one match
  res <- cols %~*% "r"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "all match (3)" )
  checkTrue( !res , msg = "all match (4)" )
  
  # no match
  res <- cols %~*% "i"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "all match (5)" )
  checkTrue( !res , msg = "all match (6)" )
  
}

test.notallmatch <- function(){
  # all match
  cols <- c("red", "blue" )
  res <- cols %!~*% "e"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! all match (1)" )
  checkTrue( !res , msg = "! all match (2)" )
  
  # one match
  res <- cols %!~*% "r"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! all match (3)" )
  checkTrue( res , msg = "! all match (4)" )
  
  # no match
  res <- cols %!~*% "i"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! all match (5)" )
  checkTrue( res , msg = "! all match (6)" )
  
}

test.anymatch <- function(){
  # all match
  cols <- c("red", "blue" )
  res <- cols %~+% "e"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "any match (1)" )
  checkTrue( res , msg = "any match (2)" )
  
  # one match
  res <- cols %~+% "r"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! any match (3)" )
  checkTrue( res , msg = "! any match (4)" )
  
  # no match
  res <- cols %~+% "i"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! all match (5)" )
  checkTrue( !res , msg = "! any match (6)" )
  
}

test.notanymatch <- function(){
  # all match
  cols <- c("red", "blue" )
  res <- cols %!~+% "e"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "any match (1)" )
  checkTrue( !res , msg = "any match (2)" )
  
  # one match
  res <- cols %!~+% "r"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! any match (3)" )
  checkTrue( !res , msg = "! any match (4)" )
  
  # no match
  res <- cols %!~+% "i"
  checkEquals( length(res) , 1 , checkNames = FALSE, msg = "! all match (5)" )
  checkTrue( res , msg = "! any match (6)" )
  
}

