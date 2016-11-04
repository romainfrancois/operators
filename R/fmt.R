`%fmt%`<-function(pattern,replacements){
  if(!is.list(replacements)){
    args<-list(pattern,replacements)
  }else{
    args<-c(pattern,replacements)
  }
  do.call(sprintf,args)
}