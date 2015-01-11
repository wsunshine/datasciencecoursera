pollutantmean <- function(directory, pollutant, id){
  i<-1
  path<-'d:\statistics\coursera\data science\course2-R language'
  
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the  csv files
    specpath<-paste(path,directory,seq = '\')
   
    ##'pollutant' is a character vector of length 1 indicating
    ##the name of the pollutant for which we will calculate the
    ##mean; either "sulfate" of"nitrate".
  for (i in id){
    ##'id' is an integer vector indicationg the monitor ID numbers
    ##'to be used
    if i <100 {
      file<-
    }else
    {file<-paste(as.character(i),'csv',sep = '.')}
    
    read.csv(".csv")
    
    ##Return the mean of the pollutant across all monitors list
    ## in the 'id' vector(ignoring NA values)
    
    i<-i+1
  }

  
}