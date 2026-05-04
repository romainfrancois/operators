
### pattern matching

#' Pattern matching operators
#'
#' Set of convenience functions to handle strings and pattern matching.
#' These are basically companion binary operators for the classic R function
#'  \code{\link{grep}} and \code{\link{regexpr}}.
#'
#' @param x text to manipulate
#' @param rx regular expression
#'
#' @return
#' \code{\%~\%} : gives a logical vector indicating which elements of \code{x}
#'  match the regular expression \code{rx}. \code{\%!~\%} is the negation of
#'  \code{\%~\%}
#'
#'  \code{\%~*\%} : gives a \emph{single} logical indicating if \emph{all} the elements
#'  of \code{x} are matching the regular expression \code{rx}. \code{\%!~*\%} is the
#'  negation of \code{\%~*\%}.
#'
#'  \code{\%~+\%} : gives a \emph{single} logical indicating if \emph{any}
#'  element of \code{x} matches the regular expression \code{rx}. \code{\%!~+\%}
#'  is the negation of \code{\%~+\%}.
#'
#' @note
#' The matching is done using a modified version of the
#'  \code{\link{regexpr}} function.
#'  The modification is performed by applying the
#'  \code{operators.regexpr} option to the \code{\link{regexpr}} function
#'  via the \code{\link{\%but\%}} operator.
#'
#'  The default version of \code{\link{regexpr}} enables the \code{perl} and
#'  \code{extended} options. See \code{\link{\%but\%}} for details.
#'
#' @examples
#' txt <- c("arm","foot","lefroo", "bafoobar")
#'  txt %~% "foo"
#'  txt %!~% "foo"
#'  txt %~*% "foo"
#'  txt %~+% "foo"
#'  txt %!~*% "foo"
#'  txt %!~+% "foo"
#'
#'  txt %~%   "[a-z]"
#'  txt %!~%  "[a-z]"
#'  txt %~*%  "[a-z]"
#'  txt %~+%  "[a-z]"
#'  txt %!~*% "[a-z]"
#'  txt %!~+% "[a-z]"
#'
#'  cols <- colors()
#'  cols[ cols %~% "^blue" ]
#'
#' @rdname pattern
#' @export
`%~%` <- function(x, rx){
  .regexpr <- regexpr %but% getOption("operators.regexpr")
  .regexpr(rx, x) > 0
}

# inverse of %~%
#' @rdname pattern
#' @export
`%!~%` <- function(x,rx) !`%~%`(x,rx)

# all versions
#' @rdname pattern
#' @export
`%~*%`  <- function(x,rx) all( `%~%` (x,rx) )

#' @rdname pattern
#' @export
`%!~*%` <- function(x,rx) !all( `%~%`(x,rx) )

# any versions
#' @rdname pattern
#' @export
`%~+%`  <- function(x,rx)  any( `%~%`(x, rx) )

#' @rdname pattern
#' @export
`%!~+%` <- function(x,rx) !any( `%~%`(x, rx) )


