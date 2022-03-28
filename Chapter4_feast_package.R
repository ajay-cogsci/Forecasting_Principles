#Chapter 4 - Time Series features - feast packages

data("aus_retail")

aus_retail %>% features(Turnover, list(mean=mean)) %>% arrange(mean)

aus_retail %>% features(Turnover, quantile)


#Auto-Correlation features - building new time-series from same time-series using Lag, difference in seasonality etc. 
#feat_acf()


aus_retail %>% features(Turnover, feat_acf)

#STL-decomposition features - find strengths of decomposed units
#feat_stl()


aus_retail %>% features(Turnover, feat_stl)

#Testing other features in feasts package

#Long Memory - Hurst Coeff - A series with long memory will have significant autocorrelations for many lags
aus_retail %>% features(Turnover, coef_hurst)

#Shannon Spectral Entropy - how easy the series is to forecast (0 is easier, strong trend, strong seasonality) (1 is worst and vice versa)
aus_retail %>% features(Turnover, feat_spectral)

#Box-Pierce - white noise and correspondinding p-val
#ljung_box - Ljung-Box statistic for same
aus_retail %>% features(Turnover, box_pierce)


aus_retail %>% features(Turnover, ljung_box)
