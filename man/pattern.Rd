\name{pattern}
\alias{\%~\%}
\alias{\%!~\%}
\alias{\%~*\%}
\alias{\%!~*\%}
\alias{\%~+\%}
\alias{\%!~+\%}

\title{ Pattern matching operators }
\description{
  Set of convenience functions to handle strings and pattern matching. 
  These are basically
  companion binary operators for the classic R function 
  \code{\link{grep}} and \code{\link{regexpr}}.
}
\usage{
  x \%~\% rx
  x \%!~\% rx
  
  x \%~*\% rx
  x \%!~*\% rx

  x \%~+\% rx
  x \%!~+\% rx
  
}
\arguments{
  \item{x}{ text to manipulate }
  \item{rx}{ regular expression }
}
\value{
  \code{\%~\%} : gives a logical vector indicating which elements of \code{x} 
  match the regular expression \code{rx}. \code{\%!~\%} is the negation of 
  \code{\%~\%}                         
  
  \code{\%~*\%} : gives a \emph{single} logical indicating if \emph{all} the elements
  of \code{x} are matching the regular expression \code{rx}. \code{\%!~*\%} is the 
  negation of \code{\%~*\%}.
  
  \code{\%~+\%} : gives a \emph{single} logical indicating if \emph{any}
  element of \code{x} matches the regular expression \code{rx}. \code{\%!~+\%} 
  is the negation of \code{\%~+\%}.
  
}
\note{
  The matching is done using a modified version of the 
  \code{\link{regexpr}} function. 
  The modification is performed by applying the 
  \code{operators.regexpr} option to the \code{\link{regexpr}} function 
  via the \code{\link{\%but\%}} operator. 
  
  The default version of \code{\link{regexpr}} enables the \code{perl} and 
  \code{extended} options. See \code{\link{\%but\%}} for details.
}

\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{grep}, \link{gsub}, \code{\link{\%~|\%}} for regular expression filters }
\examples{                        
  txt <- c("arm","foot","lefroo", "bafoobar")
  txt \%~\% "foo"
  txt \%!~\% "foo"
  txt \%~*\% "foo"
  txt \%~+\% "foo"
  txt \%!~*\% "foo"
  txt \%!~+\% "foo"
  
  txt \%~\%   "[a-z]"
  txt \%!~\%  "[a-z]"
  txt \%~*\%  "[a-z]"
  txt \%~+\%  "[a-z]"
  txt \%!~*\% "[a-z]"
  txt \%!~+\% "[a-z]"
  
  
  cols <- colors()
  cols[ cols \%~\% "^blue" ]
  # see also \%~|\%
  
  
  ## needs perl regular expression for the \\\\d, see %but%
  with( options( operators.regexpr = "p" ), {
  	cols[ cols \%!~\% "\\\\d$" ]
  } )
  
}
\keyword{ utilities }

