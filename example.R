df <- sample(100, size = 1000, replace = TRUE)

df <- df[df > 50]

hist(df)
