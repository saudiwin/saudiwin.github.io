functions {
  
  // need custom randomized response likelihood given confusion matrix P
  
  real sens_reg_lpmf(array[] int y, vector pi, matrix P) {

    // generalized RR model from Heck and Moshagen (2018)
    // see R package RRreg
    
    int N = size(y);
    array[N] real out;
    
    for(n in 1:N) {
      
      if(y[n]==1) {
      
        out[n] = log(P[2,1] * (1 - pi[n]) + P[2,2] * pi[n]);
      
      } else if(y[n]==0) {
      
        out[n] = log(P[1,1]*(1-pi[n]) + P[1,2]*pi[n]);
      
      }
      
    }
    
    return sum(out); 
    
    
  }
  
}
data {
  int N_rr;
  int N_direct;
  array[N_rr] int success_cm;
  array[N_rr] int fail_cm;
  int success_d;
  int fail_d;
  int K; // number of covariates
  matrix[N_rr,K] cov; // covariate data
  matrix[2,2] P; // miss-classification matrix
}
parameters {
  
  real<lower=0,upper=1> d_hat;
  vector[K] beta;
  real<lower=0> phi;
  
}
transformed parameters  {
  vector<lower=0,upper=1>[N_rr] pi_i_hat;
  pi_i_hat = inv_logit(cov*beta);
  
}
model {

  beta ~ normal(0,5);
  phi ~ exponential(.1);

  success_d ~ binomial(success_d + fail_d, d_hat);
  success_cm ~ sens_reg(pi_i_hat, P);
  
}
generated quantities {
  
  real p_hat = mean(inv_logit(cov*beta));
  real estimand =  mean(pi_i_hat) - d_hat;
  
}
