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

# Test 1: Correlation test between Ash and Jacki
cor_ash_jacki <- cor(reading_data$ash_pages, reading_data$jacki_pages)
print(paste("Correlation between Ash and Jacki's reading pages:", cor_ash_jacki))

# Test 2: Mean pages read by each student
mean_pages_read <- colMeans(reading_data[,-1])
print("Mean pages read by each student:")
print(mean_pages_read)

# Test 3: Test if the mean pages read by the couple is significantly different from the others
t_test_ash_vs_matt <- t.test(reading_data$ash_pages, reading_data$matt_pages)
print("T-test result Ash vs Matt:")
print(t_test_ash_vs_matt)

# Test 4: Variance of pages read per day for each student
variance_pages_read <- apply(reading_data[,-1], 2, var)
print("Variance of pages read per day for each student:")
print(variance_pages_read)

# Test 5: Check if any student consistently read more pages than others across the 100 days
max_pages_read <- apply(reading_data[,-1], 2, max)
print("Maximum pages read in a day by each student:")
print(max_pages_read)
