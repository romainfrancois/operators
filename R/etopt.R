#' Modification of function arguments
#'
#' Modifies the arguments of a function
#'
#' @param fun Function to modify
#' @param x Modifier
#'
#' @return A function with the same body as the \code{fun} argument but
#' with a different list of arguments.
#'
#' @details
#' The \code{\%but\%} operator is S3-generic with the following methods:
#'
#'  - A default method which does nothing more than returning the \code{fun} function.
#'
#'  - A character method. In that case, \code{x} describes the logical
#'    arguments of the function. \code{x} is a single character string containing
#'    one or several token of the form \code{ab} where \code{b} is the first
#'    letter of the logical argument we wish to modify and \code{a} is
#'    an optional modifier. \code{a} can be empty or \code{+}, in which
#'    case the argument will be set to \code{TRUE}; \code{-} in which case the
#'    argument will be set to \code{FALSE}; or \code{!} in which case the
#'    argument will be the opposite of the current value in \code{fun}
#'
#'  - A list. In that case, arguments that are part of the formal
#'    arguments of \code{fun} and elements of the list \code{x} are
#'    updated to the element in \code{x}
#'
#' @examples
#' ### default method, nothing is done
#' rnorm %but% 44
#'
#' ### character method, operating on logical arguments
#' grep %but% "pf"     # grep, with perl and fixed set to TRUE
#' grep %but% "i-e"    # grep, ignoring the case but not using extended regular expressions
#' ( grep %but% "vp" )( "blue", colors() )
#'
#' ### list method
#' rnorm %but% list( mean = 3 )
#'
#' \dontrun{
#'   rnorm %but% list( nonsense = 4 )
#' }
#'
#' @rdname but
#' @export
`%but%` <- function( fun, x ){
  UseMethod( "%but%", x )
}

#' @export
`%but%.default` <- function(fun,x){
  match.fun(fun)
}

#' @export
`%but%.list` <- function( fun, x ){
  fun <- match.fun( fun )
  allArgs <- formals(fun)

  okArgs <- x[ names(x) %in% names(allArgs) ]
  allArgs[ names( okArgs ) ] <- okArgs
  formals(fun) <- allArgs
  fun
}

#' @export
`%but%.character` <- function( fun, x ){
  fun <- match.fun( fun )
  if( nchar(x) == 0) return(fun)

  allArgs <- formals(fun)
  test_is_logical <-  sapply( allArgs, is.logical )
  shortArgs <- substring( names(allArgs[test_is_logical]), 1,1)

  chars <- gregexpr( "[!-]?[a-zA-Z]", x )[[1]]
  chars <- substring( x, chars, chars + attr(chars, "match.length") - 1)
  for( current in chars ){
    actualChar <- gsub("[^a-zA-Z]", "", current )
    if( ! actualChar %in% shortArgs ) {
      warning( sprintf("No option with first letter `%s` in function", actualChar ) )
      next
    }

    ### if find a "!" ,  set the option to the opposite of the default
    allArgs[test_is_logical][[ which(actualChar == shortArgs)  ]] <- if( length(grep("!", current) ) ){
       !allArgs[test_is_logical][[ which(actualChar == shortArgs) ]]
    } else length(grep("-", current)) == 0
  }
  formals(fun) <- allArgs
  fun
}


