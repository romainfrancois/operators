`%+=%` <- function(object, value ){
  UseMethod( "%+=%" )
}

`%+=%.default` <- function( object, value ){
  ob <- deparse(substitute(object) )
  val <- deparse( substitute( value ) )
  command <- paste( ob, "<-", ob, "+", val )
  invisible( eval( parse( text = command ), env = parent.frame(1) ) )
}

