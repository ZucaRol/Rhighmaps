#' <RdataToJS>
#'
#' <Convierte un dataframe de R a una lista interpretable por rexportin.js>
#'
#' @param x unn dataframe de dos columnas.
#' La primera con el códligo de homologación de los datos.
#' La segunda con los datos.
#' @export



RdataToJS<-function(x){
  x<-as.data.frame(x)
  colnames(x)<-c("codeRHM","value")
  dat=list()
  for(i in 1:nrow(x)){
    dat[i]=list(x[i,])
  }
  return(dat)
}