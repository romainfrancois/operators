\name{patternFilter}
\alias{\%~|\%}
\alias{\%!~|\%}
\title{ Regular expression filters }
\description{
  Filters a character vector by a regular expression.
}
\usage{
  x \%~|\% rx
  x \%!~|\% rx
  
}
\arguments{
  \item{x}{ text to manipulate }
  \item{rx}{ regular expression }
}
\value{
  '\code{\%~|\%}' : a character vector containing all the elements of \code{x}
  that match the regular expression \code{rx} or \code{NULL} if there 
  is no match.
  
  '\code{\%!~|\%}' : a character vector containing all the elements of 
  \code{x} that \emph{do not} match the regular expression \code{rx}.
}
\note{
  The filtering is done using the \code{regexpr} function. Logical arguments 
  of \code{regexpr} can be indirectly used by \code{\%~|\%} or \code{\%!~|\%} by using
  the \code{operators.regexpr} option declared with this package. 
  See \code{\link{\%but\%}} for a description of this mecanism. 
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{grep}, \link{gsub} }
\examples{                        
  
  cols <- colors()
  cols \%~|\% "^blue"
  
  ### blue colors that don't finish with a digit
  ( a1 <- cols \%~|\% "blue" \%!~|\% "\\\\d$"         )
  ( a2 <- cols \%~|\% "blue[^0-9]*$"                )
  ( a3 <- grep( "blue[^0-9]*", cols, value = TRUE ) )
  
  # using perl regular expressions
  
  ### not necessary since p is in the default of the package
  with( options( operators.regexpr = "p" ), { 
  	( a4 <- grep( "blue[^\\\\d]*", cols, value = TRUE, perl = TRUE  ) )
  	( a5 <- cols \%~|\% "blue[^\\\\d]*$" )
  })
  
  ### blue colors that contain a r
  cols \%~|\% "blue" \%~|\% "r"
  grep( "r", grep( "blue", cols, value = TRUE ), value = TRUE  )
  
  ### blue colors that don't contain a r
  cols \%~|\% "blue" \%!~|\% "r"
  cols \%~|\% "^[^r]*blue[^r]*$"
  
  grep( "^[^r]*$", grep( "blue", cols, value = TRUE ), value = TRUE  ) # tricky and verbose
  # or in two steps, ... laborious
  bluecols <- grep( "blue", cols, value = TRUE )
  bluecols[ -grep( "r", bluecols) ]
  
}
\keyword{ utilities }

