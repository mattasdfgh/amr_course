# New session - morning 19th September

# A note on manual calculations.
# Note how this is false. Use the mean function, do not use manual mean.
# all.equal version of the code marks them as identical, could be useful.
x <- rnorm(1e6)
hist(x, breaks = 100)

mean_x <- mean(x)
manual_mean_x <- sum(x) / length(x)

mean_x == manual_mean_x
all.equal(mean_x, manual_mean_x)
##

