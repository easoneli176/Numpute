#' Takes a numeric vector with missing values in a dataset and imputes a tailored value into the missing instances
#' and outputs an additional field to denote which values were originally missing
#'
#' @param data a dataset
#' @param numvar the numeric field in the dataset to have its missing values imputed
#' @param method the methodology to be use for imputation
#' @param preds an optional input; the names of fields to be used as predictors if method = "reg" (regression)
#' @param chosenval an optional input; if you simply want a particular value to be imputed,
#' you can make it the chosen value to impute
#' @return two vectors: one with the original field with imputed values,
#' and another that indicates which values in the original field were missing prior to imputation
#' @examples
#' mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#' numpute(mock_data,"missvar","chosenval",chosenval=3)
#' numpute(mock_data,"missvar","mean")
#' numpute(mock_data,"missvar","median")
#' numpute(mock_data,"missvar","mode")
#' numpute(mock_data,"missvar","reg",c("pred1","pred2"))
#' model<-ImpReg(mock_data,"missvar",c("pred1","pred2"))
#' numpute(mock_data,"missvar","model",c("pred1","pred2"),model=model)

numpute<-function(data,numvar,method,preds=c("empty"),chosenval=0,model=0){
  impvec<-rep(1,dim(data)[1])

  numcol<-which(colnames(data) == numvar)
  numvar2<-data[,numcol]

  missind<-ifelse(is.na(numvar2),1,0)

  if(method == "chosenval"){
    impvec<-ifelse(is.na(numvar2),chosenval,numvar2)
  }

  if(method == "mean"){
    meanval<-mean(numvar2,na.rm=TRUE)
    impvec<-ifelse(is.na(numvar2),meanval,numvar2)
  }

  if(method == "median"){
    medval<-median(numvar2,na.rm=TRUE)
    impvec<-ifelse(is.na(numvar2),medval,numvar2)
  }


  if(method == "mode" & length(Modes(numvar2))>1){print("Warning: multiple modes, output uses first detected mode")}

  if(method == "mode"){
    modval<-Mode(numvar2)
    impvec<-ifelse(is.na(numvar2),modval,numvar2)
  }

  if(method == "reg"){

    mod<-ImpReg(data,numvar,preds)

    predvals<-predict(mod,data,type="response")

    impvec<-ifelse(is.na(numvar2),predvals,numvar2)
  }

  if(method == "model"){
    mod<-model

    predvals<-predict(mod,data,type="response")

    impvec<-ifelse(is.na(numvar2),predvals,numvar2)
  }

  newvec<-cbind(impvec,missind)
  colnames(newvec)<-c(paste0(numvar,"_imputed"),paste0(numvar,"_missingind"))

  newvec
}
