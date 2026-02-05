set.seed(123)

# ----------------------------
# Setup
# ----------------------------
N <- 200
n_group <- 20
stopifnot(N %% n_group == 0)

alpha <- 1
beta  <- 2
sigma_eps  <- 1
sigma_beta <- 0.25

# Fixed design across simulations
X <- rnorm(N, 0, 1)
group_id <- factor(rep(1:n_group, each = N / n_group))

suppressPackageStartupMessages({
  library(lme4)
  library(sandwich)
  library(lmtest)
})

# ----------------------------
# SE helpers
# ----------------------------
lm_se <- function(fit) summary(fit)$coefficients["X", "Std. Error"]
hc1_se <- function(fit) sqrt(vcovHC(fit, type = "HC1")["X", "X"])
cluster_se <- function(fit, cluster) sqrt(vcovCL(fit, cluster = cluster, type = "HC1")["X", "X"])

# For lmer: SE for fixed effect uses vcov of fixed effects
lmer_se <- function(fit) sqrt(vcov(fit)["X", "X"])

# ----------------------------
# Monte Carlo
# ----------------------------
S <- 2000

out <- replicate(S, {
  # random slope deviation by group
  u_g <- rnorm(n_group, 0, sigma_beta)

  # DGP: fixed intercept, random slope by group
  y <- alpha + (beta + u_g[as.integer(group_id)]) * X + rnorm(N, 0, sigma_eps)

  dat <- data.frame(y = y, X = X, group = group_id)

  fit_lm   <- lm(y ~ X, data = dat)
  fit_lmer <- lmer(y ~ X + (0 + X | group), data = dat, REML = TRUE)

  c(
    # estimates
    beta_hat_lm   = coef(fit_lm)["X"],
    beta_hat_lmer = fixef(fit_lmer)["X"],

    # reported SEs for beta
    se_lm      = lm_se(fit_lm),
    se_hc1     = hc1_se(fit_lm),
    se_clust   = cluster_se(fit_lm, cluster = dat$group),
    se_lmer    = lmer_se(fit_lmer),

    # variance component estimate for random slope (optional)
    sigma_beta_hat_lmer = as.numeric(attr(VarCorr(fit_lmer)$group, "stddev")[1])
  )
}, simplify = TRUE)

out <- as.data.frame(t(out))

# ----------------------------
# Compare "population SE" (Monte Carlo SD) vs average reported SE
# ----------------------------
mc_sd_lm   <- sd(out$beta_hat_lm)
mc_sd_lmer <- sd(out$beta_hat_lmer)

avg_se_lm    <- mean(out$se_lm)
avg_se_hc1   <- mean(out$se_hc1)
avg_se_clust <- mean(out$se_clust)
avg_se_lmer  <- mean(out$se_lmer)

cat("\n--- OLS vs Mixed Model: slope on X ---\n")
cat(sprintf("Monte Carlo SD of OLS beta_hat:            %.4f\n", mc_sd_lm))
cat(sprintf("Avg lm() SE (i.i.d. homoskedastic):        %.4f\n", avg_se_lm))
cat(sprintf("Avg HC1 robust SE (heteroskedastic i.i.d.):%.4f\n", avg_se_hc1))
cat(sprintf("Avg cluster-robust SE (by group):          %.4f\n", avg_se_clust))

cat("\n")
cat(sprintf("Monte Carlo SD of lmer fixed-slope beta:   %.4f\n", mc_sd_lmer))
cat(sprintf("Avg lmer SE for fixed slope beta:          %.4f\n", avg_se_lmer))

cat("\n--- Random slope SD recovery (lmer) ---\n")
cat(sprintf("True sigma_beta:                           %.4f\n", sigma_beta))
cat(sprintf("Mean estimated sigma_beta (lmer):          %.4f\n", mean(out$sigma_beta_hat_lmer)))
