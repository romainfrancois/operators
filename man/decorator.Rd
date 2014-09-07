\name{character decorator}
\alias{\%x=\%}
\alias{\%x=|\%}
\alias{strrep}
\title{ Creates string decorators by repeating a pattern }
\description{
  Creates string decorators by repeating a pattern
  either a given number of times or so that it takes 
  a given number of character
}
\usage{
txt \%x=\% n
txt \%x=|\% length.out
strrep( txt, n, length.out=getOption("width") )
}
\arguments{
  \item{txt}{ Pattern to repeat }
  \item{n}{ Number of times to repeat the pattern}
	\item{length.out}{number of character the output should be}
}
\value{
  A character string
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \code{\link{paste}}, \code{\link{sprintf}}, \code{\link{rep}} }
\examples{
"=" \%x=\% 80
"<-+->" \%x=|\% 80
strrep( ".-", n = 10 )
strrep( ".-", length.out = 50 )
strrep( ".-" )
}
\keyword{ manip }

