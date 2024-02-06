library(ggplot2)
set.seed(123)
days <- 100
avg_pages <- c(Matt = 50, Ash = 45, Jacki = 30, Rol = 40, Mike = 35)
matt_pages <- rnorm(days, mean=avg_pages["Matt"], sd=10)
ash_pages <- matt_pages + rnorm(days, mean=5, sd=5)  # Positively correlated with Matt
jacki_pages <- rnorm(days, mean=avg_pages["Jacki"], sd=15)
rol_pages <- rnorm(days, mean=avg_pages["Rol"], sd=10)
mike_pages <- rnorm(days, mean=avg_pages["Mike"], sd=8)
matt_pages[matt_pages < 0] <- 0
ash_pages[ash_pages < 0] <- 0
jacki_pages[jacki_pages < 0] <- 0
rol_pages[rol_pages < 0] <- 0
mike_pages[mike_pages < 0] <- 0
df_pages <- data.frame(
  Day = 1:days,
  Matt = matt_pages,
  Ash = ash_pages,
  Jacki = jacki_pages,
  Rol = rol_pages,
  Mike = mike_pages
)
ggplot(df_pages, aes(x = Day)) +
  geom_line(aes(y = Matt, color = "Matt")) +
  geom_line(aes(y = Ash, color = "Ash")) +
  geom_line(aes(y = Jacki, color = "Jacki")) +
  geom_line(aes(y = Rol, color = "Rol")) +
  geom_line(aes(y = Mike, color = "Mike")) +
  labs(title = "Daily Pages Read by Each Undergraduate Over 100 Days",
       x = "Day", y = "Pages Read") +
  scale_color_manual(values = c("Matt" = "blue", "Ash" = "red", "Jacki" = "green", "Rol" = "purple", "Mike" = "orange")) +
  theme_minimal()

