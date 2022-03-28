library(fpp3)
library(tsfeatures)
#Decomposition of Time Series - 1. Transformation (Box&Cox) and Adjustment

#Global Economy data for India - 
#Population Adjustment - GDP to GDP per capita

data("global_economy")

global_economy %>% filter(Country=="India") %>% autoplot(GDP/Population) +
  labs(title="GDP per Capita for India", y="$US")


global_economy %>% filter(Country=="India") %>% mutate(GDPperCapita = GDP/Population) -> india_data


#Box-Cox transformation - for when variations are based on the level (avg) of time series data
#transformation - log/power etc.

#Calculation of lambda using guerrero() and plot using box_cos(data,lamda) and some features() and pull() function

lambda_ind <- india_data %>% features(GDPperCapita, features = guerrero) %>% pull(lambda_guerrero)


india_data %>% autoplot(box_cox(GDPperCapita, lambda_ind)) + labs(y="",title=paste("Transformed GDP plot using lambda = ", round(lambda_ind, 2)))


#STL decompisition (Seasonality, Trend, Remainder)
#Output type - dable (decomposition table)

decomp <- india_data %>% model(stl= STL(GDPperCapita))

#Viewing the decomp (dable) components
components(decomp)

#plotting trend against time-series

components(decomp) %>% as_tsibble() %>% autoplot(GDPperCapita, color="gray")+ geom_line(aes(y=trend), color="orange")+labs(y="", title="GDP per Capita for India against Trend")

#plotting all components of "dable" object - decomp

autoplot(components(decomp))

#No seasonality in GDP growth !

