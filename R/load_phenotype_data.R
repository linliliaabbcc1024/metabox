#'Upload phenotype data.
#'@description fdas
#' dasfs
#'@usage
#'@param file an object with a child named datapath, which is the direction of the file input
#'@param
#'@details
#'
#'@return
#'@author Sili Fan \email{fansili2013@gmail.com}
#'@seealso
#'@examples
#'@export
load_phenotype_data = function(file,...){
  if(grepl("xlsx", file$name)){
    #### currently, data should be at the first sheetIndex. ???
    p <- tryCatch(xlsx::read.xlsx2(file$datapath, sheetIndex = 1, stringsAsFactors = FALSE, ...),
                  error = function(e){
                    openxlsx::read.xlsx(file$datapath, sheet = 1)
                  })
  }
  if(grepl("csv", file$name)){
    p <- read.csv(file$datapath, stringsAsFactors = FALSE, ...)
  }
  return(p)
}
