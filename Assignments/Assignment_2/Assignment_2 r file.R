iris
iris[1,]
view(iris)
iris$Petal.Width
mean(iris$Petal.Width)
summary(iris$Sepal.Width)
names(iris)
#length * width 
iris$Petal.Length * iris$Petal.Width
iris$Petal.Area <- iris$Petal.Length * Iris$Petal.Width

iris[,'Sepal.Length']
for(i in names(iris)){
  x <- iris[,i] 
print(summary(x))
}

x <- c("sucks", "is stupid", "is cool")
for (i in x){
  print(paste0("your mom",i))
}
