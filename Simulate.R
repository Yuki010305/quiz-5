install.packages("reshape2")
library("reshape2")
install.packages("ggplot2")
library("ggplot2")
install.packages("car")
library("car")
install.packages("MASS")
library("MASS") 

set.seed(123)
matt_pages <- sample(20:100, 100, replace = TRUE)
rol_pages <- sample(20:100, 100, replace = TRUE)
mike_pages <- sample(20:100, 100, replace = TRUE)
mean_pages <- c(60, 60)
cor_matrix <- matrix(c(1, 0.7, 0.7, 1), 2, 2)
correlated_pages <- mvrnorm(n = 100, mu = mean_pages, Sigma = cor_matrix * 15^2)
ash_pages <- correlated_pages[,1]
jacki_pages <- correlated_pages[,2]
days <- 1:100
reading_data <- data.frame(days, matt_pages, ash_pages, jacki_pages, rol_pages, mike_pages)

cor_ash_jacki <- cor(reading_data$ash_pages, reading_data$jacki_pages)

mean_pages_read <- colMeans(reading_data[,-1])

t_test_ash_vs_matt <- t.test(reading_data$ash_pages, reading_data$matt_pages)

variance_pages_read <- apply(reading_data[,-1], 2, var)

max_pages_read <- apply(reading_data[,-1], 2, max)

list(cor_ash_jacki, mean_pages_read, t_test_ash_vs_matt, variance_pages_read, max_pages_read)