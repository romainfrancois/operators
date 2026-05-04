#' not in
#'
#' Negation of the \code{\%in\%} operator.
#'
#' @param x The values to be matched
#' @param table The values to \emph{not} be matched against
#'
#' @return Logical vector, negation of the \code{\%in\%} operators on the same arguments.
#'
#' @examples
#' 1:10 %!in% c(1,3,5,9)
#'
#' @name notIn
#' @rdname notIn
#' @export
`%!in%` <- function(x,table) !`%in%`(x,table)

#' Remove certain elements from a vector
#'
#' Remove the elements in \code{table} from \code{s}
#'
#' @param x Vector
#' @param table Elements to remove from \code{x}
#'
#' @return \code{x} without the elements of \code{table}
#'
#' @examples
#' letters %without% "a"
#' @export
`%without%` <- function(x,table){
  x[ !x %in% table ]
}

#' Creates string decorators by repeating a pattern
#'
#' Creates string decorators by repeating a pattern
#' either a given number of times or so that it takes
#' a given number of character
#'
#' @param txt Pattern to repeat
#' @param n Number of times to repeat the pattern
#' @param length.out number of character the output should be
#'
#' @return A character string
#'
#' @examples
#' "=" %x=% 80
#' "<-+->" %x=|% 80
#'
#' @rdname decorator
#' @export
`%x=%` <- function(txt, n){
	strrep(txt, times = n)
}

#' @rdname decorator
#' @export
`%x=|%` <- function(txt, length.out){
  out <- paste( rep(txt, ceiling( length.out / nchar(txt)  )) , collapse = "" )
	substr( out, 1, length.out)
}

#' Is an object of a given class
#'
#' Operator to check if an object is of a given class
#'
#' @param x R object
#' @param y Character string, the class to check against.
#'
#' @return Logical value indicating the result
#'
#' @examples
#' iris %of% "data.frame"
#'
#' @rdname of
#' @export
`%of%` <- function(x, y){
  inherits(x,y)
}

