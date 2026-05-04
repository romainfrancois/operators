### send to file

#' @importFrom utils capture.output
..redirect <- function(object, file, type = c("output", "message", "both"), append){
	type <- match.arg( type )
  if( is.character(file) ) file <- file( file, open = if(append) "at" else "wt")
  if( type %in% c("output", "message") ) sink( file , append = append, type = type)
  else{
     sink( file, type = "output")
     sink( file, type = "message")
  }
	# borrow the capture function in svMisc instead of all that
	# or should I create a text connection, write the expression in, and source it ?
  txt <- capture.output(
	  eval( parse( text = deparse(substitute(object))) )
		)
	if( type %in% c("output", "both") ) cat( txt, sep = "\n" )
	if( type %in% c("output", "message") ) sink(type = type)
  else{
     sink( type = "output")
     sink( type = "message")
  }
  close(file)

}

..readfromfile <- function(object, file, append = FALSE, objname, envir, verbose = getOption("verbose")){
  content <- readLines(file,n=-1)
  if (append){ # try to get the content of the object
    obj.content <- try( get(objname,envir), silent = !verbose )
    if (inherits(obj.content, "try-error" )) {
      obj.content <- NULL
    }
    content <- c(obj.content,content)
  }
  assign(objname,content, envir=envir )
  invisible(NULL)
}

### send to file
#' @export
#' @rdname files
`%file>%`   <- function( object, file) ..redirect(object, file, type="output", append=FALSE)

#' @export
#' @rdname files
`%file>>%`  <- function( object, file) ..redirect(object, file, type="output" , append=TRUE )

#' @export
#' @rdname files
`%2>>%` <- function( object, file) ..redirect(object, file, type="message", append=TRUE )

#' @export
#' @rdname files
`%2>%`  <- function( object, file) ..redirect(object, file, type="message", append=FALSE)

#' @export
#' @rdname files
`%*>>%` <- function( object, file) ..redirect(object, file, type="both", append=TRUE )

#' @export
#' @rdname files
`%*>%`  <- function( object, file) ..redirect(object, file, type="both", append=FALSE)

### read from file

#' Read or write an R object to/from a file
#'
#' A set of functions to quickly redirect output to a file or read character vectors
#'  from a file.
#'
#' @param object R object to print to the file or to read from the file
#' @param file file in which to read or write
#'
#' @details
#' \code{\%file>\%} sends the \code{object} to the \code{file}. The object is printed to the file
#'   according to the function specified in the \code{operators.print} option supplied with this package,
#'   most likely to be the \code{\link{print}} function. See examples.
#' \code{\%file>>\%} appends the output to the file.
#'
#' \code{\%2>\%} sends the message stream to the file by \code{\link{sink}}ing the
#' \code{message} stream to the file. See \code{\link{sink}} for details.
#' \code{\%2>>\%} appends the message stream to the file.
#'
#' \code{\%*>\%} sends both output and message streams to the file. \code{\%*>>\%} appends them.
#' \code{\%<\%} reads the content of the file into the \code{object}. \code{\%<<\%} appends the
#'  content of the file to the object.
#'
#' @return NULL, used for the side effects.
#'
#' @examples
#' \dontrun{
#'   rnorm(30) \%>\% "test.txt"
#'   stop("problem") \%2>>\% "test.txt"
#'   x \%<\% "test.txt"
#'   x
#' }
#'
#' @export
#' @rdname files
`%<%`   <- function( object, file) ..readfromfile(object, file, append=FALSE, objname=deparse(substitute(object)), envir = parent.frame(1))

#' @export
#' @rdname files
`%<<%`  <- function( object, file) ..readfromfile(object, file, append=TRUE , objname=deparse(substitute(object)), envir = parent.frame(1))
