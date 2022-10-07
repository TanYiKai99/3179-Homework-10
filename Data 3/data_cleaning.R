setwd("C:/Users/tappe/OneDrive/Desktop/Stuff/Work/Data Visualisation/Assignment 2/Data/")
library("dplyr")

oneStar = read.csv("one-star-michelin-restaurants.csv")
head(oneStar)
oneStar = oneStar[,c("name", "latitude", "longitude", "city", "region", "cuisine", "price")]
head(oneStar)
Ranks = rep(1,nrow(oneStar))
oneStar = cbind(oneStar,Ranks)
head(oneStar)

one_star_count = oneStar %>% group_by(region)
one_star_count = summarise(one_star_count,
                           Count = n())
one_star_count = cbind(one_star_count,rep(1,nrow(one_star_count)))
one_star_count = one_star_count %>% rename(
  Country = region,
  Count = Count,
  Ranks = "rep(1, nrow(one_star_count))"
)
head(one_star_count)
sum(one_star_count$Count)



twoStar = read.csv("two-stars-michelin-restaurants.csv")
head(twoStar)
twoStar = twoStar[,c("name", "latitude", "longitude", "city", "region", "cuisine", "price")]
head(twoStar)
Ranks = rep(2,nrow(twoStar))
twoStar = cbind(twoStar,Ranks)
head(twoStar)

two_star_count = twoStar %>% group_by(region)
two_star_count = summarise(two_star_count,
                           Count = n())
two_star_count = cbind(two_star_count,rep(2,nrow(two_star_count)))
two_star_count = two_star_count %>% rename(
  Country = region,
  Count = Count,
  Ranks = "rep(2, nrow(two_star_count))"
)
head(two_star_count)
sum(two_star_count$Count)



threeStar = read.csv("three-stars-michelin-restaurants.csv")
head(threeStar)
threeStar = threeStar[,c("name", "latitude", "longitude", "city", "region", "cuisine", "price")]
head(threeStar)
Ranks = rep(3,nrow(threeStar))
threeStar = cbind(threeStar,Ranks)
head(threeStar)

three_star_count = threeStar %>% group_by(region)
three_star_count = summarise(three_star_count,
                           Count = n())
three_star_count = cbind(three_star_count,rep(3,nrow(three_star_count)))
three_star_count = three_star_count %>% rename(
  Country = region,
  Count = Count,
  Ranks = "rep(3, nrow(three_star_count))"
)
head(three_star_count)
sum(three_star_count$Count)



full_list = rbind(oneStar, twoStar, threeStar)
write.csv(full_list, "full_list.csv")
country_stars = rbind(one_star_count, two_star_count, three_star_count)
write.csv(country_stars, "country_stars.csv")
