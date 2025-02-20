library(deSolve)  # For numerical integration
library(MASS)     # For generating multivariate normal distributions

# Define gravitational constant and Earth parameters
G <- 6.67430e-11  # m^3/kg/s^2
M_earth <- 5.972e24  # kg
R_earth <- 6371e3  # m (radius of Earth)
mu <- G * M_earth  # Standard gravitational parameter

# Function to simulate asteroid collision
simulate_asteroid_collision <- function(n_samples = 1000, time_span = 10*365*24*3600) {

    # Initial mean state vector [x, y, z, vx, vy, vz] (randomly chosen example)
    mu_init <- c(1.5e11, 0, 0, 0, 30000, 0)  # 1 AU from Earth

    # Covariance matrix representing orbital uncertainty (example values)
    sigma_init <- diag(c(1e7, 1e7, 1e7, 10, 10, 10))  # Adjust as needed

    # Generate Monte Carlo samples from multivariate normal distribution
    samples <- mvrnorm(n_samples, mu = mu_init, Sigma = sigma_init)

    # Define equations of motion for numerical integration
    equations_of_motion <- function(t, state, params) {
        x <- state[1]
        y <- state[2]
        z <- state[3]
        vx <- state[4]
        vy <- state[5]
        vz <- state[6]

        r <- sqrt(x^2 + y^2 + z^2)
        ax <- -mu * x / r^3
        ay <- -mu * y / r^3
        az <- -mu * z / r^3

        return(list(c(vx, vy, vz, ax, ay, az)))
    }

    # Simulate each trajectory
    impact_count <- 0
    for (i in 1:n_samples) {

        print(paste0("Processing sample ",i))

        # Initial state for sample
        state_init <- samples[i,]

        # Integrate orbit over time_span
        times <- seq(0, time_span, by = 86400)  # Daily steps
        traj <- ode(y = state_init, times = times, func = equations_of_motion, parms = NULL, method = "rk4")

        # Check for impact (if within Earth's radius)
        distances <- sqrt(traj[,2]^2 + traj[,3]^2 + traj[,4]^2)
        if (any(distances < R_earth)) {
            impact_count <- impact_count + 1
        }
    }

    # Estimate impact probability
    impact_probability <- impact_count / n_samples
    return(impact_probability)
}

# Run the simulation
impact_prob <- simulate_asteroid_collision(n_samples = 1000, time_span = 10*365*24*3600)
print(paste("Estimated impact probability:", impact_prob))
