\name{fmt}
\alias{\%fmt\%}
\title{ Python-style string formatting }
\description{
  A piped version of \code{\link{sprintf}} that functions like the Python \% operator. 
}
\usage{
  pattern \%fmt\% replacements
}
\arguments{
  \item{pattern}{ A charactor vector with \%tokens to be formatted and replaced. }
  \item{replacement}{ A single vector or list of vectors that provide the replacements for each \%token in the pattern. }
}
\value{
  A formatted character vector.
}
\author{ Jeremy Oldfather <contact@jeremyoldfather.com> }
\seealso{ \code{\link{sprintf}} }
\examples{
  
> "Hello, \%s world\%s" \%fmt\% list(c("cruel","mad"),c("?","!"))

[1] "Hello, cruel world?" "Hello, mad world!" 
  
}
\keyword{ file }
\keyword{ manip }

