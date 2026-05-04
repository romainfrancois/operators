#' Pipe an R object to a unix command
#'
#' The operator \code{\link{print}}s the R object into a temporay file and
#'  then executes the unix command though a \code{\link{pipe}}
#'
#' @param r Any R object
#' @param u character string representing the unix command
#'
#' @return
#' An object of S3-class \code{unixoutput}. The \code{print} method
#'  for \code{unixoutput} objects simply \code{\link{cat}} the
#'  string.
#'
#' @examples
#' \dontrun{
#'    rnorm(30) %|% 'head -n2'
#'    rnorm(30) %|% 'sed "s/^ *\\\\[[0-9]*\\\\]//g" '
#' }
#'
#' @rdname pipe
#' @name pipe
#' @export
`%|%` <- function( r, u){
  tf <- tempfile()
  on.exit( unlink( tf) )
  sink(tf)
  print( r )
  sink()
  pi <- pipe( paste( "cat", tf, "|", u ) )
  out <- readLines( pi )
  close(pi)
  structure( out, class= "unixoutput")
}

#' @export
print.unixoutput <- function( x, ...){
  if (length(x) > 0) {
	  cat( x, sep = "\n", ...)
  }
}

