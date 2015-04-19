## load dataset
library(datasets)
data(iris)
data(mtcars)

virginicalSepalLenMean <- mean(iris3[, "Sepal L.", "Virginica"])
irisColMeans <- apply(iris[, 1:4], 2, mean)

mpgByCyl <- tapply(mtcars$mpg, mtcars$cyl, mean)
hpByCyl <- tapply(mtcars$hp, mtcars$cyl, mean, simplify = FALSE)
hpAbsDiff <- abs(abs(hpByCyl$`4`) - abs(hpByCyl$`8`))