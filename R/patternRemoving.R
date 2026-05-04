
### pattern removing

#' @rdname patternSubstitution
#' @export
`%-~%` <- function(txt, pattern){
  .gsub <- ..gsub %but% getOption("operators.gsub")
  .gsub( pattern , "", txt)
}

# filters and remove

#' Remove a pattern from a character vector
#'
#' Removes a pattern from a character vector.
#'
#' @param txt text to manipulate
#' @param pattern regular expression
#'
#' @return
#' \code{\%-~\%} : Removes the pattern \code{rx} from the character vector \code{x}.
#'  It is equivalent of using \code{gsub( rx, "", x )}.
#'
#'  \code{\%-~|\%} does a two-step operation. First, it selects the elements of
#'  \code{x} that match the pattern \code{rx} and then it removes the pattern from the
#'  rest.
#'
#'  \code{\%o~|\%} does a slightly more complicated two-step operation. It first
#'  gets the elements of \code{txt} that match the \code{pattern} and then keeps
#'  only the part that matches the pattern. Similar to the \code{grep -o} in recent
#'  versions of unix.
#'
#' @note
#'  \code{\%-~\%} does the substitution via the \code{\link{gsub}} function. One can
#'  pass arguments to the \code{gsub} function using the \code{operators.gsub} option
#'  declared by this package. See \code{\link{\%but\%}} for a description of this
#'  mechanism.
#'
#'  The filtering in \code{\%-~|\%} is performed by \code{\link{\%~|\%}} and therefore
#'  options can be passed to \code{regexpr} using the \code{operators.regexpr} option.
#'
#'  For \code{\%o~|\%}, if the pattern given does not contain opening and closing
#'  round brackets, the entire matching space is retained, otherwise only the part that
#'  is contained between the brackets is retained, see the example below.
#'
#'  \code{\%s~\%} is an attempt to provide some of the functionnality of the
#'  unix's \code{sed}. The \code{pattern} is split by "/" and used as follows:
#'  the first part is the regular expression to replace, the second is the
#'  replacement, and the (optional) third gives modifiers to the \code{gsub} function
#'  used to perform the replacement. Modifiers are passed to \code{gsub} with
#'  the \code{\link{\%but\%}} operator. The "g" modifier can also be used in order
#'  to control if the \code{gsub} function is used for global replacement or the \code{sub}
#'  function to only replace the first match. \emph{At the moment "/" cannot be used
#'  in the regular expressions}.
#'
#' @examples
#'  txt <- c("arm","foot","lefroo", "bafoobar")
#'  txt %-~% "foo"
#'  txt %-~|% "foo"
#'
#'  ### Email of the R core team members
#'  rcore <- readLines(file.path(R.home("doc"),"AUTHORS"))
#'  rcore %~|% "@" %-~% "(.*<|>.*)"
#'
#'  ### or this way
#'  # angle brackets are retained here
#'  rcore %o~|% "<.*@.*>"
#'  rcore %o~|% "<.*@.*>" %-~% "[<>]"
#'
#'  # allows to perform the match using < and > but strips them from the result
#'  rcore %o~|% "<(.*@.*)>"
#'
#'  # really silly english to french translator
#'  pinks <- colors() %~|% "pink"
#'  pinks %s~% "/pink/rose/"
#'  gsub( "pink", "rose", pinks )
#'
#'  # perl regex pink shouter
#'  pinks %s~% "/(pink)/\\\\U\\\\1/p"
#'  gsub( "(pink)", "\\\\U\\\\1", pinks, perl = TRUE )
#'
#'  # see ?gsub
#'  gsub("(\\\\w)(\\\\w*)", "\\\\U\\\\1\\\\L\\\\2", "a test of capitalizing", perl=TRUE)
#'  "a test of capitalizing" %s~% "/(\\\\w)(\\\\w*)/\\\\U\\\\1\\\\L\\\\2/gp"
#'
#' @name patternSubstitution
#' @rdname patternSubstitution
#' @export
`%-~|%` <- function(txt, pattern){
  (txt %~|% pattern) %-~% pattern
}

#' @rdname patternSubstitution
#' @export
`%o~|%` <- function(txt, pattern){
  txt <- txt %~|% pattern
	txt %o~% pattern
}

#' @rdname patternSubstitution
#' @export
`%s~%` <- function( txt, pattern ){
  if( pattern %!~% "^/") stop( gettext("the regular expression should start with a '/'") )
  pattern <- ( pattern %/~% "/" ) [-1]
  modif <- if( length(pattern) ==3 && nchar(pattern[3]) > 0 ){ # get the modifiers
    pattern[3]
  } else  getOption("operators.gsub")

  .gsub <- ..gsub %but% modif
  .gsub( pattern[1], pattern[2], txt )
}


#' Only keeps the macthing part of a regular expression
#'
#' The operator \%o~\% is used to retain the only the part of the \code{txt}
#'	that matches the regular expression.
#'
#' @param txt Character vector
#' @param pattern Regular expression
#'
#' @return In case where parts of the regular expression
#'	are surrounded by brackets, the operator returns a matrix with as many lines
#'	as the length of txt and as many columns as chunks of regular expressions.
#'
#' @examples
#' x <- c("foobar","barfooooooooooooobar")
#' x %o~% "fo+"
#'
#' @rdname patternRemoving
#' @export
`%o~%` <- function(txt, pattern){
	if( txt %!~+% pattern) return(NULL)
	if( pattern %!~% "\\(.*?\\)" ) {
		pattern <- sprintf("(%s)", pattern)
	}
	if( pattern %!~% "^\\^" ){
		pattern <- sprintf( "^.*?%s", pattern )
	}
	if( pattern %!~% "\\$$" ){
	  pattern <- sprintf( "%s.*?$", pattern)
	}

	# how many chunks to keep
	n <- length( gregexpr("\\([^)]*\\)", pattern)[[1]]  )

	out <- rep( list(NULL), n )
	for( i in 1:n ){
		out[[i]] <- ifelse( txt %~% pattern,
			gsub( pattern, sprintf("\\%d", i), txt, perl = TRUE ),
			getOption("operators.o.nomatch") )
	}
	out <- do.call( cbind, out )
	rownames( out ) <- txt
	out
}

#' Divide by a pattern
#'
#' split a character vector by a regular expression
#'
#' @param txt text to manipulate
#' @param rx regular expression
#'
#' @return A character vector. For convenience, this function does not return a list
#'  as \code{\link{strsplit}} does.
#'
#' @details
#' \code{\%/~\%} uses \code{\link{strsplit}} to split the strings. Logical arguments
#'  of \code{\link{strsplit}} can be indirectly modified using the \code{operators.strsplit}
#'  option declared as part of this package. For example, it uses perl regular expressions
#'  by default. See \code{\link{\%but\%}} for a description.
#'
#' @examples
#' "Separate these  words by spaces" %/~% " +"
#'
#'  ### From ?strsplit
#'  unlist(strsplit("a.b.c", "\\\\."))
#'  "a.b.c" %/~% "\\\\."
#'
#' @rdname patternDivision
#' @name patternDivision
#' @export
`%/~%` <- function( txt, rx ){
  .strsplit <- strsplit %but% getOption("operators.strsplit")
  unlist( .strsplit( txt, rx) )
}

### gsub or sub depending on the global argument
..gsub <- function(pattern, replacement, x, ignore.case = FALSE,
    perl = FALSE, fixed = FALSE, useBytes = FALSE, global=TRUE){

   if(global) gsub(pattern = pattern ,replacement = replacement, x = x,
   	ignore.case = ignore.case, perl = perl , fixed = fixed, useBytes = useBytes)
   else sub(pattern = pattern,replacement = replacement, x = x,
   	ignore.case = ignore.case, perl = perl, fixed = fixed, useBytes = useBytes)
}


