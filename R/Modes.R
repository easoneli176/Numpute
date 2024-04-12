#' Calculates all modes of a numeric vector
#'
#' @param x a numeric vector
#' @return a vector
#' @examples
#' numvec<-as.numeric(c(1,2,3,3,4,4,"NA"))
#' Modes(numvec)
#' Note this returns all modes

Modes<-function(x){
  ux <- unique(x)
  tab <- tabulate(match(x,ux))
  ux[tab == max(tab)]
}
