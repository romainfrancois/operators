#' Plus Equal Operator
#'
#' Plus equal operator
#'
#' @param object object to which to add something
#' @param value object to add
#'
#' @return NULL. Used for the side effect of changing the value of \code{object}
#'
#' @examples
#' x <- 4
#' x %+=% 4
#' x
#'
#' @name plusEqual
#' @rdname plusEqual
#' @export
`%+=%` <- function(object, value ){
  UseMethod( "%+=%" )
}

#' @export
`%+=%.default` <- function( object, value ){
  ob <- deparse(substitute(object) )
  val <- deparse( substitute( value ) )
  command <- paste( ob, "<-", ob, "+", val )
  invisible( eval( parse( text = command ), envir = parent.frame(1) ) )
}

