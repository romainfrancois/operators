\name{\%of\%}
\alias{\%of\%}
\title{ Is an object of a given class }
\description{
  Operator to check if an object is of a given class
}
\usage{
x \%of\% y
}
\arguments{
  \item{x}{ R object }
  \item{y}{ Character string, the class to check against. }
}
\value{
  Logical value indicating the result
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \code{\link{inherits}} }
\examples{
iris \%of\% "data.frame"
}
\keyword{ manip }

