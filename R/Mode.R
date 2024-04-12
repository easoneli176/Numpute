#' Calculates a mode of a numeric vector
#'
#' @param x a numeric vector
#' @return a number
#' @examples
#' numvec<-as.numeric(c(1,2,3,3,4,4,"NA"))
#' Mode(numvec)
#' Note this returns the first mode found

Mode<-function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x,ux)))]
}
