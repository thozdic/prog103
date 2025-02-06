library(marinecs100b)
remotes::install_github("MarineCS-100B/marinecs100b")

# Review: write a function ------------------------------------------------

# P1 Describe succinctly what the following code does. This should be a
# high-level, one-sentence description, not a line-by-line breakdown.

site <- "Nuka_Pass"
season <- "Late winter"
n_cold <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
hours_cold_per_day
# It takes information from a given site and finds how many hours the
# temperature at the site was below -4 degrees

# P2 Let's turn that code chunk into a function. What would you call that
# function? How many parameters should it take and what would you call them?
# cold_hours_day
# Let's use two parameters: site and season

# P3 Write a function to encapsulate the code chunk above. Check that it
# contains all five parts of a function.
cold_hours_day <- function(site, season) {
  n_cold <- sum(kefj_site == site &
                  kefj_season == season &
                  kefj_temperature <= -4 &
                  kefj_exposure == "air")
  n_total <- sum(kefj_site == site &
                   kefj_season == season)
  hours_cold <- n_cold * 30 / 60
  days_total <- n_total * 30 / 60 / 24
  hours_cold_per_day <- hours_cold / days_total
  return(hours_cold_per_day)
}

cold_hours_day("Nuka_Pass", "Late winter")


# Make an extreme choice --------------------------------------------------

# P4 Fill in the code below to create a logical vector indicating extreme
# temperatures.

extreme_type <- "cold" #change between cold and hot
if (extreme_type == "cold") {
  is_extreme <- kefj_temperature <= -4
} else if (extreme_type == "hot") {
  is_extreme <- kefj_temperature >= 25
}
is_extreme

# P5 Copy-paste the code from P1 and edit it to incorporate the is_extreme
# vector into the extreme temperature exposure procedure.
site <- "Nuka_Pass"
season <- "Late winter"
n_extreme <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air" & is_extreme)
n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_extreme <- n_extreme * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_extreme_per_day <- hours_extreme / days_total
hours_extreme_per_day


# P6 Copy-paste the function you wrote in P3 and edit it to add a parameter that
# lets you switch between extreme heat and cold exposure.
# God bless the internet
extreme_hours_day <- function(site, season, hotorcold) {
  if (hotorcold == "cold") {
    # Cold (temperature <= -4)
    n_extreme <- sum(kefj_site == site &
                       kefj_season == season &
                       kefj_temperature <= -4 &
                       kefj_exposure == "air")
  } else if (hotorcold == "hot") {
    # Hot (temperature >= 25)
    n_extreme <- sum(kefj_site == site &
                       kefj_season == season &
                       kefj_temperature >= 25 &
                       kefj_exposure == "air")
  }
  n_total <- sum(kefj_site == site &
                   kefj_season == season)
  hours_extreme <- n_extreme * 30 / 60
  days_total <- n_total * 30 / 60 / 24
  hours_extreme_per_day <- hours_extreme / days_total
  return(hours_extreme_per_day)
}
extreme_hours_day("Nuka_Pass", "Late winter", "cold")

# Season to taste ---------------------------------------------------------

# P7 What seasons are in the kefj dataset? What function would you use to
# identify them? Late winter, Early winter, Spring, Summer, Fall. kefj_season in
# the console tells you all the seasons in the kefj dataset.

# P8 Fill in the blanks below to make a for loop that prints the extreme hot and
# cold exposure across seasons at site Aialik.

seasons <- c("Late winter", "Early winter", "Spring", "Summer", "Fall")
# could use unique(kefj_season) instead of listing them but I don't think I
# would've known to do that
  for (season in seasons) {
    heat_exposure <- extreme_hours_day("Aialik", season, "hot")
    cold_exposure <- extreme_hours_day("Aialik", season, "cold")
    print(paste("Aialik", season, heat_exposure, cold_exposure))
}

# P9 Copy-paste your answer to P8 and add a nested for loop to iterate across
# sites as well as seasons.
seasons <- unique(kefj_season)
sites <- unique(kefj_site)
for (site in sites) {
  for (season in seasons) {
  heat_exposure <- extreme_hours_day(site, season, "hot")
  cold_exposure <- extreme_hours_day(site, season, "cold")
  print(paste(site, season, heat_exposure, cold_exposure))
  }
}

# P10 Examine your results from P9. You should find two outputs where both
# extreme heat and cold exposure were 0. What season were they in?
# "Nuka_Bay Fall 0 0" and "Harris Fall 0 0"
