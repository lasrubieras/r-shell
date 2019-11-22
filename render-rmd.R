library(rmarkdown)
library(stringr)
file_names <- commandArgs(trailingOnly = TRUE)

if("-a" %in% file_names){
  folder <- file_names[2]
  file_names <- Sys.glob(str_c(folder, '/*.csv'))
} else {file_names <- file_names}


for(file in file_names)
{
  out_name <- str_split_fixed( string = file,
                         pattern = "[/|.]",
                         n =3)
  out_name <- str_c(out_name[2],'.html')
  print(out_name)
  render("surveys-report.Rmd", 
       output_dir = "reports",
       output_file = out_name,
       params = list( file = file))
}