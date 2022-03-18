library(patchwork)

# Here is my loaded die; but you can use any distribution of probabilities you like as long as they sum to 1.
myprobs <- c(0.5,0.25,0.125,0.0675,0.03375,0.02375)

# We can simulate a single die's results over many trials.
set.seed(1)
x <- sample(1:6, size = 1000, replace = TRUE, prob = myprobs)
barplot(table(x))

# And we can simulate what happens with a sumamtion of the dice, for increasing numbers of die. 
# We are going to roll each of our sets of die 1,000 times. We will then add up the results and save it for plotting.

# Lets look at 1 through 10 dice.
die_count = 20

# Make our empty array to store the results of our 1000 rolls / summations using different numbers of dice.
sums <- array(0,c(1000,die_count))

# For each die count entering the summation 1 die up to die_count.
for(i in 1:die_count){
  
  # Lets loop over the die in our current set...
  dice <- array(0,c(i,1000))
  for(j in 1:i){
    dice[j,] <- sample(1:6, size = 1000, replace = TRUE, prob = myprobs)
  }
  # And lets add up the resulting rolls for our set of die. 
  sums[,i] <- colSums(dice)
}

# One die.
barplot(table(sums[,1]))

# Two die.
barplot(table(sums[,2]))

# 20 die.
barplot(table(sums[,20]))
