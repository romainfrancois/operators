\name{notIn}
\alias{\%!in\%}
\title{ Not in }
\description{
  Negation of the \code{\%in\%} operator.
}
\usage{
  x \%!in\% table
}
\arguments{
  \item{x}{The values to be matched}
  \item{table}{The values to \emph{not} be matched against}
}
\value{
  Logical vector, negation of the \code{\%in\%} operators on the same arguments.
}
\author{ Romain Francois <francoisromain@free.fr> }
\examples{                        
  1:10 \%!in\% c(1,3,5,9)  
}
\keyword{ utilities }

