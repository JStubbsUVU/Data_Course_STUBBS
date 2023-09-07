# Assignment 2
#Joshua Stubbs
csv_files <- list.files(path="Data",pattern = ".csv")
csv_files
?length()
length(csv_files)
length(1:10)
1:10
df <- read.csv("Data/wingspan_vs_mass.csv")
df <- read.csv("Data/wingspan_vs_mass.csv")
head(df,n=5)
df <- read.csv("./Data/wingspan_vs_mass.csv")    
head(df,n=5)
list.files(path="data",pattern = "b", recursive = TRUE)
list.files(path="data",pattern = "^b", recursive = TRUE)
csv_files <- list.files(path="DATA",pattern = ".csv", full.names = TRUE)
csv_files
lenth(csv_files)
length(1:10)
df <- read.csv("./Data/wingspan_vs_mass.csv")
head(df,n=5)
#find all files that start w "b"
list.files(path="Data", pattern = "^b", recursive = True,full.names = TRUE)
bfiles <- list.files(path= "Data",
           pattern = "^b",
           recursive = TRUE,
           full.names = TRUE)
readLines("Data/data-shell/creatures/basilisk.dat",n=1)
bfiles
for(i in bfiles){
  print(readLines(i,n=1))
}

x <- 1:10
for(i in x){
  print(i*2)
}
#task 1 
csv_files <- list.files(path="DATA",pattern = ".csv", full.names = TRUE)
csv_files
csv_files
#task 2 make a loop 
for(i in csv_files){
  print(readLines(i,n=1))
}


