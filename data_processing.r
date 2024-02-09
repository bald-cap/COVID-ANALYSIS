library(RMariaDB)
# Assuming rstudioapi is installed. If not, you might need to install it using install.packages("rstudioapi")
password <- rstudioapi::askForPassword("knuMANJwJYSM2Nd1")
con <- dbConnect(drv = RMariaDB::MariaDB(), 
                 user = 'michael-kofi.nyanyui', 
                 password = password, 
                 dbname = '23_2L2_michael_kofi_nyanyuie', 
                 host = '10.10.190.39',
                 port = 3306
				)