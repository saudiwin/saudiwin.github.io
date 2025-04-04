library(httr)
library(jsonlite)
library(dplyr)
library(readr)

get_sentry_object_details <- function(designation) {
    # Load required package
    if (!requireNamespace("httr", quietly = TRUE)) {
        install.packages("httr")
    }
    if (!requireNamespace("jsonlite", quietly = TRUE)) {
        install.packages("jsonlite")
    }

    library(httr)
    library(jsonlite)

    # Construct the API URL
    base_url <- "https://ssd-api.jpl.nasa.gov/sentry.api"
    query <- list(des = designation)

    # Send GET request to the API
    response <- GET(base_url, query = query)

    # Check if the request was successful
    if (status_code(response) != 200) {
        stop("Failed to retrieve data: ", status_code(response))
    }

    # Parse the JSON content
    content <- content(response, as = "text", encoding = "UTF-8")
    data <- fromJSON(content, flatten = TRUE)

    # Check if data contains the expected fields
    if (!"data" %in% names(data)) {
        stop("No data found for the specified designation.")
    }

    # Convert to data frame
    df <- as.data.frame(data$data)

    # Get current date
    current_date <- Sys.Date()

    # Save the data frame as an RData file with date in filename
    filename <- paste0("~/website/post/nasa_beta/sentry_", designation, "_", current_date, ".rds")
    saveRDS(df, file = filename)

    message("Data saved as: ", filename)

    return(df)
}

# Example usage
sentry_details <- get_sentry_object_details("2024 YR4")
print(sentry_details)

# do the same but for ESA

# Define the base URL for the Risk List API endpoint
base_url <- "https://neo.ssa.esa.int/PSDB-portlet/download?file=esa_risk_list"

# Send a GET request to the API endpoint
response <- GET(base_url)

# Check if the request was successful
if (status_code(response) == 200) {
  
  temp_file <- tempfile(fileext = ".txt")
  
  # Write response content to the file
  writeLines(content(response, "text", encoding = "UTF-8"), temp_file)
  
  # Read the saved file as a table
  risk_list_df <- read_delim(temp_file,delim = "|",col_names = TRUE,skip = 2,
                             trim_ws=TRUE) %>% 
    select(obj="Num/des.       Name",
           prob="IP max") %>% 
    dplyr::filter(obj=="2024YR4")
  
  # Add a column with the current date
  risk_list_df <- risk_list_df %>%
    mutate(RetrievalDate = Sys.Date())
  
  # Display the first few rows of the data frame
  print(head(risk_list_df))
  
  # Optionally, save the data frame to a CSV file
  saveRDS(risk_list_df, paste0("~/website/post/nasa_beta/esa_risk_List_", Sys.Date(), ".rds"))
} else {
  # Print an error message if the request failed
  print(paste("Failed to retrieve data. Status code:", status_code(response)))
}

# render the file

library(quarto)
library(git2r)

quarto_render("~/website/post/nasa_beta/",as_job = F,cache = F)

add(path="~/website/_site/post/nasa_beta/index.html")
add(path="~/website/_site/post/nasa_beta/*.png")
add(path="~/website/_site/post/nasa_beta/figure-html/*")
add(path="~/website/_site/post/nasa_beta/index_files/*")
add(path="~/website/post/nasa_beta/sentry*")
add(path="~/website/post/nasa_beta/index.html")
add(path="~/website/post/nasa_beta/*.png")
add(path="~/website/post/nasa_beta/figure-html/*")
add(path="~/website/post/nasa_beta/index_files/*")

commit(message = paste0("NASA Sentry smoother prediction ",Sys.Date()))

system("git push origin master")

# send bluesky post

library(bskyr)

bs_post(text="(Automated post):\n\nToday's smoothed NASA Sentry impact probabilities for asteroid 2024 YR4 (the big one) plus a 10-day forward prediction.\n\nSee blog post for details: https://www.robertkubinec.com/post/nasa_beta/",
        images="~/website/post/nasa_beta/nasa_sentry_predict.png",
        images_alt="Plot shows model smoothing and predictions of NASA Sentry impact probability for the asteroid 2024 YR4.")
