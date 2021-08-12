summary(iris)

#DataVisuaization
par(mfrow=c(2,2))
hist(iris$Sepal.Length, col="palegreen", breaks=20)
hist(iris$Sepal.Width, col="palegreen", breaks=20)
hist(iris$Petal.Length, col="palegreen", breaks=20)
hist(iris$Petal.Width, col="palegreen", breaks=20)

#Checking the distribution of 'Sepal width vs Sepal Length' and 'Petal width vs Petal length'

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
geom_point()

ggplot(data = iris, aes(x = Petal.Width, y = Petal.Length, col = Species)) +
  geom_point()

set.seed(124)
iris[,1:4] <- scale(iris[,1:4])
setosa<- rbind(iris[iris$Species=="setosa",])
versicolor<- rbind(iris[iris$Species=="versicolor",])
virginica<- rbind(iris[iris$Species=="virginica",])


ind <- sample(1:nrow(setosa), nrow(setosa)*0.8)
iris.train<- rbind(setosa[ind,], versicolor[ind,], virginica[ind,])
iris.test<- rbind(setosa[-ind,], versicolor[-ind,], virginica[-ind,])
iris[,1:4] <- scale(iris[,1:4])


iris_pred <- knn(train = iris.train[,1:4], test = iris.test[,1:4], cl = iris.train$Species, k=5)

t<-table(iris.test$Species,iris_pred)
t[2][2]
accuracy<-29/30
accuracy
