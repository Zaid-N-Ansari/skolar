#p1

  #q1.1
27*(38-17)
  #q1.2
log(147)
  #q1.3
436^12

  #q2
nums <- 20:60
sum(nums)

  #q3
strrev <- function(string) {
  if(!is.character(string)) {
    string <- as.character(string)
  }
  string2charvec <- strsplit(string, split="")[[1]]
  return(paste(rev(string2charvec), collapse=""))
}
strrev(4565.2)

  #q4
string <- "Hello World, I am R"
extractedString <- substr(string, 7, nchar(string))
extractedString


#p2

  #q1
vec <- c(60:70)
for(n in vec) {
  cat("Square Root & Cube Root of", n, "is", sqrt(n), "&", n^{1/3}, "respectively\n")
}

  #q2
num <- 57
for(i in 2:sqrt(num)) {
  if(num %% i == 0) {
    print(paste(num, "is not prime"))
    break
  } else {
    print(paste(num, "is prime"))
    break
  }
}

  #q3
m1 <- matrix(1:9, ncol = 3, nrow = 3)
m2 <- matrix(-1:-9, ncol = 3, nrow = 3, byrow=TRUE)
m1 + m2


#p3

  #q1
fact <- function(num) {
  if(!is.numeric(num)) {
    return(paste("Expected an Integer instead got a", typeof(num)))
  }
  prod <- 1
  for(n in 2:num) {
    prod <- n * prod
  }
  return(prod)
}
fact("2")
fact(5)

  #q2
yr <- 2024
if((yr%%4 == 0 && yr%%100 != 0) || yr%%400 == 0) {
  cat(yr, "is a leap year")
} else {
  cat(yr, "is not a leap year")
}


#p4
data(iris)
library(dplyr)

  #q1
sepalLenGT6 <- iris %>% filter(Sepal.Length > 6)
sepalLenGT6

  #q2
newColSepalLenSq <- iris %>% mutate(Sepal.Length.Square = Sepal.Length^2, .after = Sepal.Length)
newColSepalLenSq

  #q3
summary(iris)

  #q4
sepalLenASC <- iris %>% arrange(Sepal.Length)
sepalLenASC
petalLenDSC <- iris %>% arrange(desc(Petal.Length))
petalLenDSC

  #q5
groupedBySpeci <- iris %>% group_by(Species) %>% summarise(Mean.Sepal.Length = mean(Sepal.Length))
groupedBySpeci


#p5
data("mtcars")
library(dplyr)

  #q1
filteredByHPGT100 <- mtcars %>% filter(hp > 100)
filteredByHPGT100

  #q2
newColHPSq <- mtcars %>% mutate(hp.square = hp^2, .after=hp)
newColHPSq

  #q3
meanStdevMPG <- mtcars %>% summarise(mean.mpg = mean(mpg), stdev.mpg = sd(mpg))
meanStdevMPG

  #q4
mtcars %>% arrange(mpg)
mtcars %>% arrange(desc(hp))

  #q5
mtcars %>% group_by(cyl) %>% summarise(mean.mpg = mean(mpg))


#p6
data("ChickWeight")
library(dplyr)

  #q1
nums <- rbinom(10, 10, 0.7)
cat("Median:",median(nums), "\n")
mode_s <- function(iterable) {
  freq <- table(iterable)
  max.freq <- max(freq)
  return(names(freq[freq==max.freq]))
}
cat(mode_s(nums), sep = ", ")

  #q2
cor(ChickWeight$weight, ChickWeight$Time)

  #q3
table(ChickWeight$Diet)
  # OR
cwdiet <- ChickWeight$Diet
vec <- c()
for(diet in cwdiet) {
  if (diet %in% names(vec)) {
    vec[diet] <- vec[diet] + 1
  } else {
    vec[diet] <- 1
  }
}
vec

  #q4
mean(c(20:60))
  #OR
sum(c(20:60))/length(c(20:60))

  #q5
cat(range(ChickWeight$weight), sep = " to ")


#p7
library(ggplot2)
library(dplyr)
data("AirPassengers")

  #q1
df = data.frame(
  month = as.numeric(cycle(AirPassengers)),
  year = as.numeric(floor(time(AirPassengers))),
  passenger = as.numeric(AirPassengers)
)
groupByYr <- df %>% group_by(year) %>% summarise(totalYearlyPassengers = sum(passenger))
ggplot(groupByYr, aes(x=year, y=totalYearlyPassengers)) +
  geom_bar(stat = "identity", fill="orange", color="black") +
  labs(x="Year", y="Number of Passengers", title="Total Passengers per Year")

  #q2
ggplot(df, aes(x=as.numeric(time(AirPassengers)), y=passenger)) +
  geom_point(color="red", size = 1) +
  labs(x="Year", y="Number of Passenger", title="Passengers VS Time")

  #q3
ggplot(df, aes(x=passenger)) +
  geom_histogram(binwidth = 40, color="lightgreen", fill="hotpink") +
  labs(x="Passengers per Year", y="Freq", title="Freq Distribution of Passengers per Year")

  #q4
ggplot(df, aes(x=factor(year), y=passenger)) +
  geom_boxplot(outliers = TRUE, fill="lightgreen") +
  labs(x="Year", y="Passengers", title="Passengers across Year")

  #q5
ggplot(df, aes(x=as.numeric(time(AirPassengers)), y=passenger)) +
  geom_line(color="red") +
  geom_point(color="forestgreen") +
  theme(
    panel.grid.major = element_line(color = "grey", size = 0.5),
    panel.grid.minor = element_line(color = "lightgrey", size = 0.25)
  ) +
  labs(x="Year", y="Number of Passenger", title="Trend of Number of Passengers per Year (Passengers VS Year[Time])")
