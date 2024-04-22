#' Takes a numeric vector with missing values and outputs a regression model that can be used to
#' impute those missing values
#'
#' @param data a dataset
#' @param numvar the numeric field in the dataset to have its missing values imputed
#' @param preds an optional input; the names of fields to be used as predictors if method = "reg" (regression)
#' @return a model
#' @examples
#' mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#' ImpReg(mock_data,"missvar",c("pred1","pred2"))

ImpReg<-function(data,numvar,preds=c("empty")){
  numcol<-which(colnames(data) == numvar)
  numvar2<-data[,numcol]

  filldat<-data[!is.na(numvar2),]
  numvar3<-filldat[,which(colnames(filldat) == numvar)]
  filldat<-filldat[,which(colnames(filldat) %in% preds)]

  mod<-lm(numvar3~.,data=filldat)

  mod
}
