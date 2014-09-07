\name{but}
\alias{\%but\%}

\title{ Modification of function arguments  }
\description{
  Modifies the arguments of a function
}
\usage{
  fun \%but\% x
}
\arguments{
  \item{fun}{ Function to modify }
  \item{x}{ Modifier }
}
\value{
  A function with the same body as the \code{fun} argument but 
  with a different list of arguments.  
}
\note{
  The \code{\%but\%} operator is S3-generic with the following methods: 
  
  - A default method which does nothing more than returning the \code{fun} function.
  
  - A charactor method. In that case, \code{x} describes the logical
  arguments of the function. \code{x} is a single character string containing 
  one or several token of the form \code{ab} where \code{b} is the first 
  letter of the logical argument we wish to modify and \code{a} is 
  an optional modifier. \code{a} can be empty or \code{+}, in which 
  case the argument will be set to \code{TRUE}; \code{-} in which case the
  argument will be set to \code{FALSE}; or \code{!} in which case the 
  argument will be the opposite of the current value in \code{fun}
  
  - A list. In that case, arguments that are part of the formal 
  arguments of \code{fun} and elements of the list \code{x} are 
  updated to the element in \code{x}
  
}

\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{args}, \link{formals} }
\examples{        
### default method, nothing is done
rnorm \%but\% 44

### character method, operating on logical arguments
grep \%but\% "pf"     # grep, with perl and fixed set to TRUE
grep \%but\% "i-e"    # grep, ignoring the case but not using extended regular expressions
( grep \%but\% "vp" )( "blue", colors() )

### list method 
rnorm \%but\% list( mean = 3 )
rnorm \%but\% list( nonsense = 4 )
}
\keyword{ utilities }

