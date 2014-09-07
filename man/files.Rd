\name{files}
\alias{\%<<\%}
\alias{\%<\%}
\alias{\%>>\%}
\alias{\%>\%}

\alias{\%<<2\%}
\alias{\%<2\%}
\alias{\%2>>\%}
\alias{\%2>\%}

\alias{\%<<*\%}
\alias{\%<*\%}
\alias{\%*>>\%}
\alias{\%*>\%}


\title{ Read or write an R object to/from a file }
\description{
  A set of functions to quickly redirect output to a file or read character vectors 
  from a file.
}
\usage{
  object \%>\% file 
  object \%>>\% file 
  
  object \%2>\% file 
  object \%2>>\% file 

  object \%*>\% file 
  object \%*>>\% file 
    
  object \%<\% file 
  object \%<<\% file 

}
\arguments{
  \item{object}{ R object to print to the file or to read from the file }
  \item{file}{ file in which to read or write }
}
\value{
  NULL, used for the side effects.
}
\details{
  \code{\%>\%} sends the \code{object} to the \code{file}. The object is printed to the file 
  according to the function specified in the \code{operators.print} option supplied with this package, 
  most likely to be the \code{\link{print}} function. See examples.
  
  \code{\%>>\%} appends the output to the file.
  
  \code{\%2>\%} sends the message stream to the file by \code{\link{sink}}ing the 
  \code{message} stream to the file. See \code{\link{sink}} for details. 
  \code{\%2>>\%} appends the message stream to the file.
  
  \code{\%*>\%} sends both output and message streams to the file. \code{\%*>>\%} appends them. 
  
  \code{\%<\%} reads the content of the file into the \code{object}. \code{\%<<\%} appends the 
  content of the file to the object.
  
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{file} }
\examples{                        
  \dontrun{
    rnorm(30) \%>\% "test.txt"
    stop("problem") \%2>>\% "test.txt"
    x \%<\% "test.txt"
    x
  }
}
\keyword{ utilities }
\keyword{file}

