
# Conditions in R ---------------------------------------------------------

# Create the following variables.

w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

# Use them to print whether or not the following statements are TRUE or FALSE.
#
# w is greater than 10
  w > 10 #TRUE
# "green" is in colors
  "green" %in% colors #TRUE
# x is greater than y
  x > y #FALSE
# Each value in masses is greater than 40.
  masses > 40 #TRUE FALSE FALSE  TRUE  TRUE
# 2 * x + 0.2 is equal to y
  x <- (2*x + 0.2)
  x == y #TRUE
# dna1 is the same as dna2
  dna1 == dna2 #FALSE
# dna1 is not the same as dna2
  dna1 != dna2 #TRUE
# w is greater than x, or y is greater than z
  w > x #TRUE
  y > z #FALSE
# x times w is between 13.2 and 13.5
  x <- 1.3
  xw <- x*w
  xw > 13.2 & xw < 13.5 #TRUE
# Each mass in masses is between 30 and 50.
  masses > 30 & masses < 50 #TRUE  TRUE FALSE FALSE  TRUE


# Making choices with if, else, and else if -------------------------------
# Demo notes
i <- 1
if (i == 1){
  print("first")
} else if (i == 2){
  print("second")
} else {
  print("other")
}

socal <- c("Los Angeles", "Orange", "San Diego")
county1 <- "San Francisco"
county2 <- "Los Angeles"
if (county1 %in% socal & county2 %in% socal){
  print("both counties in socal")
} else if (county1 %in% socal){
  print("county1 in socal")
} else if (county2 %in% socal){
  print("county2 in socal")
} else {
  print("no counties in socal")
}

# 1. Complete the following if statement so that if age_class is equal to “egg”
# it sets y <- 10.

age_class = "egg"
if (age_class == "egg") {
  print(y <- 10)
}
y

# 2. Complete the following if statement so that if age_class is equal to “egg”
# it sets y <- 10 and if age_class is equal to “larva” it sets y <- 5.

age_class = "larva"
if (age_class == "egg") {
  print(y <- 10)
} else if (age_class == "larva"){
  print(y <- 5)
}
y

# 3. Complete the following if statement so that if age_class is equal to “egg”
# it sets y <- 10 and if age_class is equal to “larva” it sets y <- 5 and if
# age_class is something else then it sets the value of y <- 0.

age_class = "adult"
if (age_class == "egg") {
  print(y <- 10)
} else if (age_class == "larva") {
  print(y <- 5)
} else {
  print(y <- 0)
}
y

# 4. Convert your if/else if/ else statement from (3) into a function that takes
# age_class as an argument and returns y. Call this function 4 times, once with
# each of the following values for age_class: “egg”, “larva”, “adult”,
# “senescent”.
y_from_age_class <- function(age_class) {
  if (age_class == "egg") {
    print(y <- 10)
  } else if (age_class == "larva") {
    print(y <- 5)
  } else {
    print(y <- 0)
  }
  return(y)
}
print(y_from_age_class("egg"))
print(y_from_age_class("larva"))
print(y_from_age_class("adult"))
print(y_from_age_class("senescent"))

# Repeating yourself with vectorized functions ----------------------------
# Demo notes
cylinder_volume <- function(radius, height) {
  result <- pi * radius^2 * height / 2
  return(result)
}
cylinder_volume(2, 3)
cylinder_volume(1,4)

radii <- c(1, 2, 3)
heights <- c(3, 2, 1)
cylinder_volume(radii, heights)

# 1. Fill in the blanks to write a vectorized function that shortens strings to
# just their first and last characters. Verify it works on the names of sharks
# below.
sharks <- c("thresher", "mako", "tiger", "hammerhead")
shorten_string <- function(string) {
  first_letter <- substr(string, 1, 1)
  # Hint: nchar() returns the number of characters in a string
  last_letter <- substr(string, nchar(string), nchar(string))
  result <- paste(first_letter, last_letter, sep = "")
  return(result)
}
shorten_string(sharks) #"tr" "mo" "tr" "hd"

# Fisheries scientists frequently need to estimate the mass of a fish from a
# different body dimension that's easier to measure. Commonly, they use the
# "fork length" of the fish, which extends to where the tail forks in two. The
# formula usually takes the form M = aL^b, where M and L are mass and fork
# length, respectively, and a and b are species-specific constants.

# 2. a and b for a shortfin mako are estimated to be 5.243e-6 and 3.141. What
# are the estimated masses of sharks that are 100, 200, and 300 cm long?
a <- 5.243e-6
b <- 3.141
a * c(100, 200, 300)^b #10.03644  88.53502 316.38634

# 3. Write a function called shortfin_mako_mass_kg that takes a parameter L_cm
# and returns the estimated masses of shortfin makos with fork lengths L_cm. Use
# your function to answer question 2.
shortfin_mako_mass_kg <- function(L_cm) {
  a <- 5.243e-6
  b <- 3.141
  mass_mako <- a * (L_cm^b)
  return(mass_mako)
}

L_cm_ex <- c(100, 200, 300)
mass_makos <- shortfin_mako_mass_kg(L_cm_ex)
print(mass_makos) #10.03644  88.53502 316.38634


# Repeating yourself with for loops ---------------------------------------
# Demo notes

# simple loop
for (i in 4:8) {
  print(i)
}

# Two types of iterators
animal <- c("fish", "octopus", "fish", "fish", "octopus")
count <- c(3, 1, 6, 7, 2)

# First type of iterator - loop over collection directly
for (a in animal) {
  print(a)
}

# Second type of iterator - loop over indices
for (i in 1:length(animal)) {
  print(rep(animal[i], count[i]))
}

# Allocate result
octopus_mass_g <- 135
fish_mass_g <- 60
total_mass <- rep(0, length(animal))
for (i in 1:length(animal)) {
  if (animal[i] ==  "octopus") {
    total_mass[i] <- count[i] * octopus_mass_g
  } else if (animal[i] == "fish") {
    total_mass[i] <- count[i] * fish_mass_g
  }
}
total_mass
animal
count

# 1. The code below prints the numbers 1 through 5 one line at a time. Modify it
# to print each of these numbers multiplied by 3.

numbers <- c(1, 2, 3, 4, 5)
for (number in numbers) {
  print(number * 3)
}

# 2. Write a for loop that loops over the following vector and prints out the
# mass in kilograms (mass_kg = 2.2 * mass_lb)

mass_lbs <- c(2.2, 3.5, 9.6, 1.2)
for (mass in mass_lbs) {
  print(mass_lbs * 2.2)
}

# 3. Complete the code below so that it prints out the name of each bird one
# line at a time.

birds = c("albatross", "puffin", "pelican", "penguin")
for (i in 1:length(birds)) {
  print(birds[i])
}

# 4. Complete the code below so that it stores one area for each radius.

radius <- c(1.3, 2.1, 3.5)
areas <- rep(0, length(radius))
for (i in 1:length(radius)) {
  areas[i] <- pi * radius[i] ^ 2
}
areas

# 5. Write a for loop that loops over the following vector and stores the height
# in meters (height_m = height_ft / 3.28) in a new vector. After the for loop
# make sure to display the vector to the console by running the vectors name on
# its own line.

height_ft <- c(5.1, 6.3, 5.7, 5.4)
height_m <- rep(0, length(height_ft)) # to store results

for (i in 1:length(height_ft)) {
  height_m[i] <- height_ft[i] / 3.28
}

height_m #1.554878 1.920732 1.737805 1.646341

# 6. Complete the code below to calculate an area for each pair of lengths and
# widths, store the areas in a vector, and after they are all calculated print
# them out:

lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- rep(0, length(lengths))
for (i in 1:length(lengths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas #3.85 5.28 4.48
