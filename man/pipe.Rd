\name{pipe}
\alias{\%|\%}
\title{ Pipe an R object to a unix command }
\description{
  The operator \code{\link{print}}s the R object into a temporay file and
  then executes the unix command though a \code{\link{pipe}} 
}
\usage{
r \%|\% u
}
\arguments{
  \item{r}{ Any R object }
  \item{u}{ character string representing the unix command }
}
\value{
  An object of S3-class \code{unixoutput}. The \code{print} method 
  for \code{unixoutput} objects simply \code{\link{cat}} the
  string.
}
\author{ Romain Francois <francoisromain@free.fr> }
\seealso{ \code{\link{pipe}} }
\examples{
  \dontrun{
    rnorm(30) \%|\% 'head -n2'
    rnorm(30) \%|\% 'sed "s/^ *\\\\[[0-9]*\\\\]//g" '
    
    if( require(R4X ) ){
        x <- xml( '<root>
            <child id="1">
              <subchild id = "sub1" >foo</subchild>
              <subchild id = "sub2" >bar</subchild>
            </child>
            <child id="2">
              <subchild id="a">blah</subchild>
              <subchild id="b">bob</subchild>
              <something id="c" />
            </child>
            <fruits>
               <fruit>banana</fruit>
               <fruit>mango</fruit>
            </fruits>
          </root>' )
        x \%|\% "xml_pp | highlight -S xml -A"  
    }
  }
}
\keyword{ file }
\keyword{ manip }

