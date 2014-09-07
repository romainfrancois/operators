\name{\%o~\%}
\alias{\%o~\%}
\title{ Only keeps the macthing part of a regular expression }
\description{
  The operator \%o~\% is used to retain the only the part of the \code{txt}
	that matches the regular expression. 
}
\usage{
txt \%o~\% pattern
}
\arguments{
  \item{txt}{ Character vector }
  \item{pattern}{ Regular expression }
}
\value{
	In case where parts of the regular expression
	are surrounded by brackets, the operator returns a matrix with as many lines 
	as the length of txt and as many columns as chunks of regular expressions.
}
\author{ Romain Francois \email{francoisromain@free.fr} }
\examples{
x <- c("foobar","barfooooooooooooobar")
x \%o~\% "fo+"
}
\keyword{ manip }

