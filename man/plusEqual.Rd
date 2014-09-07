\name{plusEqual}
\alias{\%+=\%}
\title{ Plus Equal Operators }
\description{
  Plus equal operator
}
\usage{
  object \%+=\% value
}
\arguments{
  \item{object}{ object to which to add something }
  \item{value}{ object to add }
}
\value{
  NULL. Used for the side effect of changing the value of \code{object}
}
\note{
  The operator \code{\%+=\%} is S3-generic with a single default 
  method implemented at the moment.  
}
\author{ Romain Francois <francoisromain@free.fr> }
\examples{                        
  
  ### standard examples
  x <- 4
  x \%+=\% 4
  x
  
  ### XML examples with the R4X package
  \dontrun{
    require("R4X")
    x <- xmlNode( "test" )
    x \%+=\% '<foo><bar/></foo>'
    x
  }
  
}
\keyword{ utilities }

