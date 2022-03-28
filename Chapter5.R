#Chapter5 - forecasting

#Step1- data preparation

gdpcc <- global_economy %>% mutate(GDP_per_Capita = GDP/Population)

#Step2- visualize - I love you South Korea

gdpcc %>% filter(Country=="South Korea") %>% autoplot(GDP_per_Capita)+labs(y="", title="GDP per Capita for South Korea")


#Step3 - model 
#Time Series Linear model uisng y ~ x

TSLM(GDP_per_Capita ~ trend())

#Step4 - train

fit <- gdpcc %>% model(trend_model = TSLM(GDP_per_Capita ~ trend()))

#Step5 - evaluate (not covered here)

#Step6 - forecast or "fable"

fit %>% forecast(h="5 years")

#Step7 - visualize the forecast

fit %>% forecast(h="5 years") %>% filter(Country =="South Korea") %>%  autoplot(gdpcc) + labs(y="", title="GDP per Capita forecast of South Korea")

#Checking residuals and innovation residuals (if any) using augment ()

augment(fit)
pl
#Converting forecast distributions into intervals using funtion hilo()
gdpcc %>% model(NAIVE(GDP_per_Capita)) %>%
  forecast(h = 3, bootstrap = TRUE, times = 1000) %>%
  hilo()

