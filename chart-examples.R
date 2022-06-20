library(tidyverse)

# Example where residuals are not normally distributed
set.seed(123)
data <- tibble(x = rnorm(1000, 5, 5),
       y = x + rlnorm(1000, sdlog = 1))

mod <- lm(y ~ x, data = data)

data_preds <- bind_cols(data, as_tibble(predict(mod, data, interval = "prediction")))

data_preds %>% 
  ggplot(aes(x = x, y = y))+
  geom_point()+
  geom_line(aes(y = fit), colour = "red", size = 1)+
  geom_ribbon(aes(ymin = lwr, ymax = upr), colour = "blue", alpha = 0.1)+
  theme_bw()+
  labs(title = "Residuals follow log-normal distribution", 
       x = NULL, y = NULL)+
  theme(axis.text.x=element_blank(), #remove x axis labels
        axis.ticks.x=element_blank(), #remove x axis ticks
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank()  #remove y axis ticks
  )+
  theme(plot.title = element_text(size=28))


# Relatedly model is not linear
set.seed(123)
data_nl <- tibble(x = rnorm(1000, 5, 1),
               y = x^3.5 + rnorm(1000, sd = 8))

mod_nl <- lm(y ~ x, data = data_nl)

data_preds_nl <- bind_cols(data_nl, as_tibble(predict(mod_nl, data_nl, interval = "prediction")))

data_preds_nl %>% 
  ggplot(aes(x = x, y = y))+
  geom_point()+
  geom_line(aes(y = fit), colour = "red", size = 1)+
  geom_ribbon(aes(ymin = lwr, ymax = upr), colour = "blue", alpha = 0.1)+
  theme_bw()+
  labs(title = "Model fit should be non-linear", 
       x = NULL, y = NULL)+
  theme(axis.text.x=element_blank(), #remove x axis labels
        axis.ticks.x=element_blank(), #remove x axis ticks
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank()  #remove y axis ticks
  )+
 theme(plot.title = element_text(size=28))


# Heteroskedasticity
set.seed(123)
data_het <- tibble(x = abs(rnorm(1000, sd = 0.7)), 
               y = x + rnorm(1000, sd = 0.6) * x / (max(x))
)

mod_het <- lm(y ~ x, data = data_het)

data_preds_het <- bind_cols(data_het, as_tibble(predict(mod_het, data_het, interval = "prediction")))

data_preds_het %>% 
  ggplot(aes(x = x, y = y))+
  geom_point()+
  geom_line(aes(y = fit), colour = "red", size = 1)+
  geom_ribbon(aes(ymin = lwr, ymax = upr), colour = "blue", alpha = 0.1)+
  theme_bw()+
  labs(title = "Assumes Consistent Variance of Residuals",
       x = NULL, y = NULL)+
  theme(axis.text.x=element_blank(), #remove x axis labels
        axis.ticks.x=element_blank(), #remove x axis ticks
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank()  #remove y axis ticks
  )+
  theme(plot.title = element_text(size=28))


#pred vs conf interval
library(tidyverse)

# Example where residuals are not normally distributed
set.seed(123)
data_norm <- tibble(x = rnorm(500, 5, 5),
               y = x + rnorm(500, sd = 7))

mod_norm <- lm(y ~ x, data = data_norm)

data_preds_norm <- bind_cols(data_norm, 
                        as_tibble(predict(mod_norm, data_norm, interval = "prediction")),
                        as_tibble(predict(mod_norm, data_norm, interval = "confidence")) %>% 
                          rename_with(~paste0(.x, "_conf")))

data_preds_norm %>% 
  ggplot(aes(x = x, y = y))+
  geom_point()+
  geom_line(aes(y = fit), colour = "red", size = 1)+
  geom_ribbon(aes(ymin = lwr, ymax = upr, fill = "prediction interval\n(range individual observations)"), colour = "blue", alpha = 0.1)+
  geom_ribbon(aes(ymin = lwr_conf, ymax = upr_conf, fill = "confidence interval\n(range average)"), colour = "blue", alpha = 0.1)+
  theme_bw()+
  labs(title = "Prediction Intervals are Wider Than Confidence Intervals", 
       x = NULL, y = NULL, fill = NULL)+
  theme(axis.text.x=element_blank(), #remove x axis labels
        axis.ticks.x=element_blank(), #remove x axis ticks
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank()  #remove y axis ticks
  )+
  theme(plot.title = element_text(size=28))+
  theme(legend.text=element_text(size=18))
