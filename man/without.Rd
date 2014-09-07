\name{\%without\%}
\alias{\%without\%}
\title{ Remove certain elements from a vector }
\description{
  Remove the elements in \code{table} from \code{s} 
}
\usage{
x \%without\% table
}
\arguments{
  \item{x}{ Vector }
  \item{table}{ Elements to remove from \code{x} }
}
\value{
  \code{x} without the elements of \code{table}
}
\author{ Romain Francois <francoisromain@free.fr> }
\examples{
  letters \%without\% "a"
}
\keyword{ character }

