library(fpp3)


data("global_economy")

autoplot(global_economy)

lambda <- global_economy %>%
  features(GDP,features = guerrero) %>%
  pull(lambda_guerrero)


lamd <- guerrero(global_economy$GDP)



plot(round(global_economy$GDP,2), round(box_cox(global_economy$GDP, lamd),2))


gg_season(global_economy$Growth)


