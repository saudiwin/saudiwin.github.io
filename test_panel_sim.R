library(tidyverse)
library(panelsim)
require(ggplot2)

set.seed(22902)

# see if DiD works

# loop 1,000 times
# canonical DiD: two time points, interact with time point

true_did_eff <- -1.5
main_coef_x <- -2

# assume treatment effects are homogeneous

first_run <- tw_data(N=1000,T=2,did.eff.mean = true_did_eff,did.eff.sd = 0,
                         cross.eff.mean = main_coef_x,binary_outcome = F,
                     cross.eff.sd=0,case.eff.sd=0,
                         cross.int.mean = .5,case.int.mean = -2)

calc_did <- parallel::mclapply(1:1000, function(i) {
  
  did_canonical <- tw_data(N=1000,T=2,did.eff.mean = true_did_eff,
                           cross.eff.mean = main_coef_x,binary_outcome = F,
                           cross.int.mean = .5,case.int.mean = -2,
                           prior_true_vals = first_run)
  
  did_est <- lm(y ~ x*factor(time), data=did_canonical$data)
  did_est_sum <- summary(did_est)
  
  tibble(ATE_DID=did_est$coefficients['x:factor(time)2'] + did_est$coefficients['(Intercept)'],
         ATE_DID_int=did_est$coefficients['factor(time)2'],
         coef_x=did_est$coefficients['x']) %>% 
    mutate(ATE_DID_trans = ATE_DID + ATE_DID_int,
        low=did_est_sum$coefficients['x:factor(time)2',"Estimate"] - 1.96*did_est_sum$coefficients['x:factor(time)2',"Std. Error"],
           high=did_est_sum$coefficients['x:factor(time)2',"Estimate"] + 1.96*did_est_sum$coefficients['x:factor(time)2',"Std. Error"],
           coverage=as.numeric(true_did_eff > low && true_did_eff < high))
  
},mc.cores=8) %>% bind_rows

summary(calc_did$ATE_DID)

summary(calc_did$ATE_DID_int)

summary(calc_did$ATE_DID_trans)

summary(calc_did$coef_x)

prop.table(table(calc_did$coverage))

# see if we can do a declaredesign thing

library(DeclareDesign)

# simple function to wrap tw_data

tw_design <- function(return_val="y",N=1,...) {
  
  gen_data <- tw_data(N=N, ...)
  
  if(return_val=="y") return(gen_data$data$y)
  
}

design_panel_did <-
  declare_model(
    N = 100,
    potential_outcomes(Y ~ rordbeta(N, mu = .5 + .05*Z,phi = 1,
                                    cutpoints=c(-3,3)
    ))
  ) +
  declare_inquiry(ATE = 0.05) +
  declare_assignment(Z = complete_ra(N, m = 50)) +
  declare_measurement(Y = reveal_outcomes(Y ~ Z)) +
  declare_estimator(Y ~ Z, .method = glmmTMB::glmmTMB, inquiry = "ATE",
                    family=glmmTMB::ordbeta,
                    .summary= tidy_avg_slopes,
                    term="Z")