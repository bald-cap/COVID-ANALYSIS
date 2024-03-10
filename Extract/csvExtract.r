library(RMariaDB)
library(readr)
library(dplyr)

# Load the CSV file
tempDF <- read_csv("temp2021.csv")

chunkSize <- 2000

# Establish a connection to your MySQL database
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "michael-kofi.nyanyui",
  password = "knuMANJwJYSM2Nd1",
  host = "10.10.190.39",
  dbname = "23_2L2_michael_kofi_nyanyuie"
)

# Iterate through chunks of the dataframe
for (i in seq(1, nrow(tempDF), by = chunkSize)) {
  chunkEnd <- min(i + chunkSize - 1, nrow(tempDF))
  newTuples <- tempDF[i:chunkEnd, ]
  
  # Save chunk to a new CSV file
  write_csv(
    newTuples,
    sprintf(
      "temp2021_chunk%d.csv",
      ((i - 1) / chunkSize) + 1
    )
  )
  
  # Write the new chunk to the database
  if (((i - 1) / chunkSize) + 1 == 1) {
    dbWriteTable(
      con,
      "TEMPERATURES",
      newTuples,
      overwrite = TRUE,
      row.names = FALSE
    )
  } else {
    dbWriteTable(
      con,
      "TEMPERATURES",
      newTuples,
      append = TRUE,
      row.names = FALSE
    )
  }
}

# Close the database connection
dbDisconnect(con)
