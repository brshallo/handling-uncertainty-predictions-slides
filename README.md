
# Handling Uncertainty in Predictions (UseR! 2022, pitch)

<!-- badges: start -->
<!-- badges: end -->

.pdf of slides for UseR! 2022 elevator pitch on "Handling Uncertainty in Predictions, Approaches to Building Prediction Intervals Within a tidymodels Framework"

The .pptx of the slides (including a rough script in the notes can be found [here](https://docs.google.com/presentation/d/1QNvx_n4_lPe4kfK4IsrkCKFDqoIgQmxp/edit?usp=sharing&ouid=104437923524095184714&rtpof=true&sd=true).)

The pitch was primarily a set-up for my series of posts from last year on building prediction intervals in the tidymodels ecosystem, which can be found at my blog.

* [Part 1: Understanding Prediction Intervals](https://www.bryanshalloway.com/2021/03/18/intuition-on-uncertainty-of-predictions-introduction-to-prediction-intervals/)
* [Part 2: Simulating Prediction Intervals](https://www.bryanshalloway.com/2021/04/05/simulating-prediction-intervals/)
* [Part 3: Quantile Regression Forests for Prediction Intervals](https://www.bryanshalloway.com/2021/04/21/quantile-regression-forests-for-prediction-intervals/)

# Abstract

In many settings your predictive model must output a range rather than just a point estimate. Three common approaches for outputting prediction intervals are to use...

1. a parametric method where the prediction intervals are solved for analytically
2. a simulation or conformal inference based approach
3. a method that outputs quantiles

In this elevator pitch, I will briefly walk through examples of how you can do each from within the tidymodels ecosystem. (See bryanshalloway.com for more detailed written examples.)
