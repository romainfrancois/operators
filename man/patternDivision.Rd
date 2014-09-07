\name{patternDivision}
\alias{\%/~\%}
\title{ Divide by a pattern }
\description{
  split a character vector by a regular expression
}
\usage{
  txt \%/~\% rx
  
}
\arguments{
  \item{txt}{ text to manipulate }
  \item{rx}{ regular expression }
}
\value{
  A character vector. For convenience, this function does not return a list 
  as \code{\link{strsplit}} does.  
}
\note{
  \code{\%/~\%} uses \code{\link{strsplit}} to split the strings. Logical arguments 
  of \code{\link{strsplit}} can be indirectly modified using the \code{operators.strsplit}
  option declared as part of this package. For example, it uses perl regular expressions
  by default. See \code{\link{\%but\%}} for a description.
}

\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{grep}, \link{gsub} }
\examples{                        
  "Separate these  words by spaces" \%/~\% " +"
  
  ### From ?strsplit
  unlist(strsplit("a.b.c", "\\\\."))
  "a.b.c" \%/~\% "\\\\."
  
}
\keyword{ utilities }

