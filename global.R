#setwd("D:\\AI-work\\R-Shiny\\catlife")

path = getwd()
filenames = list.files(path=paste(path, sep =""), pattern="*.rda")

for (i in filenames){
  load(file=paste(path,"/", i, sep =""))
}
