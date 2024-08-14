data {
  
  real success_cm;
  real fail_cm;
  int success_d;
  int fail_d;
  
}
parameters {
  
  real<lower=0,upper=1> pi_hat; 
  real<lower=0,upper=1> d_hat; 
  real<lower=0,upper=1> d_hat_binomial; 
  
}
transformed parameters  {
  
  real estimand =  pi_hat - d_hat;
  
}
model {
  
  pi_hat ~ beta(success_cm, fail_cm);
  d_hat ~ beta(success_d+1, fail_d+1);
  success_d ~ binomial(success_d + fail_d, d_hat_binomial);
}
