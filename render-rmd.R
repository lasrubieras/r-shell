library(rmarkdown)
file_names <- commandArgs(trailingOnly = TRUE)

render("surveys-report.Rmd", 
       output_dir = "reports",
       params = list( file = file_names))
