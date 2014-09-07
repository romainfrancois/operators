\name{withOptions}
\alias{options}
\alias{with.options}

\title{ Alternative option mechanism}
\description{
  \code{options} is a slight rework on \code{\link[base]{options}} that 
	gives a S3 class \code{options} to the result. This allows the definition
	of a \code{with} method for the options. This is useful to execute a 
	block of code \emph{with} a set of options.
	
}
\usage{
\S3method{with}{options}(data, expr, \dots)
options(\dots)
}
\arguments{
	\item{\dots}{ Options to use. See \code{\link[base]{options}} for details. }
	\item{data}{Options to use. This is typically a call to the \code{options} function}
	\item{expr}{Code to execute.}
}
\value{
  For the function \code{with.options}, the result 
	of the expression given in \code{expr} is returned. See details below.
}
\details{The result of the expression that is evaulated is modified
 in order to keep the option context it is associated with. The class 
 of the object created by the expression is expanded to 
 include the \code{withOptions} class and the \code{withOptions} 
 attribute that keeps the context in which the object has been created. 
 
 This mechanism has been implemented specially for the automatic printing
 of objects that happens outside the call to the \code{with.options}
 function and not reflect the options requested by the user when the object
 is printed.
}

\author{ Romain Francois <francoisromain@free.fr>}
\seealso{ The original \code{\link[base]{options}} function in the base package. }
\examples{
	
	# part of ?glm
	counts <- c(18,17,15,20,10,20,25,13,12)
  outcome <- gl(3,1,9)
  treatment <- gl(3,3)
  print(d.AD <- data.frame(treatment, outcome, counts))
  glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())
	
	summary( glm.D93 )
	
	with( options(show.signif.stars = FALSE,show.coef.Pvalues=FALSE), 
		summary( glm.D93) )
	
	a <- try( 
	  with( options( warn = 2) , warning( "more than a warning" ) ), 
		silent = TRUE )
  class( a )
}
\keyword{ programming }

