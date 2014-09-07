\name{patternSubstitution}
\alias{\%-~|\%}
\alias{\%-~\%}
\alias{\%o~|\%}
\alias{\%s~\%}
\title{ Remove a pattern from a character vector }
\description{
  Removes a pattern from a character vector.
}
\usage{
  txt \%-~\% pattern
  txt \%-~|\% pattern
  txt \%o~|\% pattern
  
}
\arguments{
  \item{txt}{ text to manipulate }
  \item{pattern}{ regular expression }
}
\value{
  \code{\%-~\%} : Removes the pattern \code{rx} from the character vector \code{x}. 
  It is equivalent of using \code{gsub( rx, "", x )}.
  
  \code{\%-~|\%} does a two-step operation. First, it selects the elements of 
  \code{x} that match the pattern \code{rx} and then it removes the pattern from the 
  rest.
  
  \code{\%o~|\%} does a slightly more complicated two-step operation. It first 
  gets the elements of \code{txt} that match the \code{pattern} and then keeps 
  only the part that matches the pattern. Similar to the \code{grep -o} in recent 
  versions of unix. 
}
\note{
  \code{\%-~\%} does the substitution via the \code{\link{gsub}} function. One can 
  pass arguments to the \code{gsub} function using the \code{operators.gsub} option
  declared by this package. See \code{\link{\%but\%}} for a description of this 
  mechanism. 
  
  The filtering in \code{\%-~|\%} is performed by \code{\link{\%~|\%}} and therefore
  options can be passed to \code{regexpr} using the \code{operators.regexpr} option.
  
  For \code{\%o~|\%}, if the pattern given does not contain opening and closing 
  round brackets, the entire matching space is retained, otherwise only the part that
  is contained between the brackets is retained, see the example below.
  
  \code{\%s~\%} is an attempt to provide some of the functionnality of the 
  unix's \code{sed}. The \code{pattern} is split by "/" and used as follows: 
  the first part is the regular expression to replace, the second is the 
  replacement, and the (optional) third gives modifiers to the \code{gsub} function
  used to perform the replacement. Modifiers are passed to \code{gsub} with
  the \code{\link{\%but\%}} operator. The "g" modifier can also be used in order
  to control if the \code{gsub} function is used for global replacement or the \code{sub}
  function to only replace the first match. \emph{At the moment "/" cannot be used 
  in the regular expressions}.
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \link{grep}, \link{gsub} }
\examples{                        
  txt <- c("arm","foot","lefroo", "bafoobar")
  txt \%-~\% "foo"
  txt \%-~|\% "foo"
  
  ### Email of the R core team members
  rcore <- readLines(file.path(R.home("doc"),"AUTHORS")) 
  rcore %~|% "@" %-~% "(.*<|>.*)" 
  
  ### or this way
  # angle brackets are retained here
  rcore \%o~|\% "<.*@.*>"
  rcore \%o~|\% "<.*@.*>" \%-~\% "[<>]"
  
  
  # allows to perform the match using < and > but strips them from the result
  rcore \%o~|\% "<(.*@.*)>"
  
  # really silly english to french translator
  pinks <- colors() \%~|\% "pink"
  pinks \%s~\% "/pink/rose/"
  gsub( "pink", "rose", pinks )
  
  # perl regex pink shouter
  pinks \%s~\% "/(pink)/\\\\U\\\\1/p"
  gsub( "(pink)", "\\\\U\\\\1", pinks, perl = TRUE )

  # see ?gsub
  gsub("(\\\\w)(\\\\w*)", "\\\\U\\\\1\\\\L\\\\2", "a test of capitalizing", perl=TRUE)
  "a test of capitalizing" \%s~\% "/(\\\\w)(\\\\w*)/\\\\U\\\\1\\\\L\\\\2/gp"
  
}
\keyword{ utilities }

