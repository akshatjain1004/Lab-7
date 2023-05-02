setosa1 <- iris[iris$Species == "setosa", "Sepal.Length"]
versicolor1 <- iris[iris$Species == "versicolor", "Sepal.Length"]
virginica1 <- iris[iris$Species == "virginica", "Sepal.Length"]
df1 <- list(Setosa = setosa1, Versicolor = versicolor1, Virginica = virginica1)

setosa2 <- iris[iris$Species == "setosa", "Sepal.Width"]
versicolor2 <- iris[iris$Species == "versicolor", "Sepal.Width"]
virginica2 <- iris[iris$Species == "virginica", "Sepal.Width"]
df2 <- list(Setosa = setosa2, Versicolor = versicolor2, Virginica = virginica2)

setosa3 <- iris[iris$Species == "setosa", "Petal.Length"]
versicolor3 <- iris[iris$Species == "versicolor", "Petal.Length"]
virginica3 <- iris[iris$Species == "virginica", "Petal.Length"]
df3 <- list(Setosa = setosa3, Versicolor = versicolor3, Virginica = virginica3)

setosa4 <- iris[iris$Species == "setosa", "Petal.Width"]
versicolor4 <- iris[iris$Species == "versicolor", "Petal.Width"]
virginica4 <- iris[iris$Species == "virginica", "Petal.Width"]
df4 <- list(Setosa = setosa4, Versicolor = versicolor4, Virginica = virginica4)

par(mfrow=c(2,2))
boxplot(df1, names = c("Setosa", "Versicolor", "Virginica"), col = c("pink", "violet", "grey"), main = "Box Plot of Sepal Length", ylab = "Sepal Length")
boxplot(df2, names = c("Setosa", "Versicolor", "Virginica"), col = c("pink", "violet", "grey"), main = "Box Plot of Sepal Width", ylab = "Sepal Width")
boxplot(df3, names = c("Setosa", "Versicolor", "Virginica"), col = c("pink", "violet", "grey"), main = "Box Plot of Petal Length", ylab = "Petal Length")
boxplot(df4, names = c("Setosa", "Versicolor", "Virginica"), col = c("pink", "violet", "grey"), main = "Box Plot of Petal Width", ylab = "Petal Width")
