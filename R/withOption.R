
options <- function( ... ){
	structure( base::options( ... ), class = "options" )
}

#' @export
print.options <- function( x, ... ){
	print( unclass( x ), ... )
}

#' Alternative option mechanism
#'
#'  \code{options} is a slight rework on \code{\link[base]{options}} that
#'	gives a S3 class \code{options} to the result. This allows the definition
#'	of a \code{with} method for the options. This is useful to execute a
#'	block of code \emph{with} a set of options.
#'
#' @param \dots Options to use. See \code{\link[base]{options}} for details.
#' @param data Options to use. This is typically a call to the \code{options} function
#' @param expr Code to execute.
#'
#' @return
#' For the function \code{with.options}, the result
#'	of the expression given in \code{expr} is returned. See details below.
#'
#' @details
#' The result of the expression that is evaulated is modified
#'  in order to keep the option context it is associated with. The class
#'  of the object created by the expression is expanded to
#'  include the \code{withOptions} class and the \code{withOptions}
#'  attribute that keeps the context in which the object has been created.
#'
#'  This mechanism has been implemented specially for the automatic printing
#'  of objects that happens outside the call to the \code{with.options}
#'  function and not reflect the options requested by the user when the object
#'  is printed.
#'
#' @examples
#'	# part of ?glm
#'	counts <- c(18,17,15,20,10,20,25,13,12)
#'  outcome <- gl(3,1,9)
#'  treatment <- gl(3,3)
#'  print(d.AD <- data.frame(treatment, outcome, counts))
#'  glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())
#'
#'	summary( glm.D93 )
#'
#'	with( options(show.signif.stars = FALSE,show.coef.Pvalues=FALSE),
#'		summary( glm.D93) )
#'
#'	a <- try(
#'	  with( options( warn = 2) , warning( "more than a warning" ) ),
#'		silent = TRUE )
#'  class( a )
#'
#' @rdname withOption
#' @name withOption
#' @export
with.options <- function( data, expr, ...){
	old.op <- data; on.exit( base::options( old.op ) )
	out <- eval( substitute( expr ) )
	attr( out, "withOptions" ) <- options()[names(old.op)]
	class( out ) <- c( "withOptions", class(out) )
	out
}

#' @export
print.withOptions <- function( x, verbose = getOption("verbose"), ...){
	old.op <- do.call( base::options, attr(x, "withOptions" ) )
	on.exit(base::options(old.op))
	if(verbose) cat ( "with options", paste( "\n", names(old.op), ":", old.op) )
	class( x ) <- setdiff( class(x), "withOptions" )
	print( x, ... )
}

