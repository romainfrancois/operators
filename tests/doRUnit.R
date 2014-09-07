
if(require("RUnit", quietly=TRUE)) {

  pkg <- "operators"
  if(Sys.getenv("RCMDCHECK") == "FALSE") {
    unitTestPath     <- file.path( getwd(), "..", "inst", "unit" )
  } else {
    unitTestPath     <- system.file(package=pkg, "unit")
  }
  
  cat("\nRunning unit and system tests\n")
  print(list(pkg=pkg, getwd=getwd(), pathToUnitTests=c( unitTestPath )))
  
  library(package=pkg, character.only=TRUE)
  attach(loadNamespace(pkg), name=paste("namespace", pkg, sep=":"), pos=3)
  
  ## Unit Testing
  testSuite <- defineTestSuite( name=paste(pkg, "unit testing"), dirs=unitTestPath)
  tests <- runTestSuite(testSuite)
  pathReport <- file.path(unitTestPath, "report")     
  printHTMLProtocol(tests, fileName=paste(pathReport, "UT.html", sep="") )
  printTextProtocol(tests, fileName=paste(pathReport, "UT.txt", sep="") )
  
  cat("Writing report in `", pathReport, "UT.html`\n", sep ="")
  tmp <- getErrors(tests)
  if(tmp$nFail > 0 | tmp$nErr > 0) {
    stop(paste("\n\nunit testing failed (#test failures: ", tmp$nFail,
               ", #R errors: ",  tmp$nErr, ")\n\n", sep=""))
  }

  
} else {
  warning("cannot run tests -- package RUnit is not available")
}
