######################################## Setting ########################################
# 1. Set working directory 
getwd()
outputFolder <- file.path(getwd(), "outputFolder")
if (!file.exists(outputFolder)) {dir.create(outputFolder, recursive = TRUE)}
# 2. DB information
my_dbms<-''     # available : postgresql, oracle, redshift, sql server, pdw, netezza, bigquery, sqlite, sqlite extended, spark
my_host<-''     # host address
my_dbname<-''   # OMOP CDM db name
my_port<-       # port
my_user<-''     # username
my_password<-'' # password
my_server <- '' # server : 123.45.123.456
# 3. Download pkg
source(file.path(getwd(), "R/Package.R"))
# 4. Download JDBC driver
pathToDriver <- file.path(getwd(), "jdbc")
downloadJdbcDrivers(my_dbms, pathToDriver)
# 5. Connect to DB
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = my_dbms,
                                                                server = paste0(my_server,"/",my_user),
                                                                user = my_user,
                                                                password = my_password,
                                                                port = my_port,
                                                                pathToDriver=pathToDriver)
connection <- DatabaseConnector::connect(connectionDetails = connectionDetails)
####################################### Query sql #######################################
# INPUT PARAMETERS
vocabulary_database_schema <-""
cdm_database_schema <-""
target_database_schema <-""
kcd_code_column <- "" # KCD-7 or ICD-10 column name in your CDM DB
oracleTempSchema = NULL # If your my_dbms is oracle, then enter "temp_schema" to oracleTempSchema
# LOGGING
ParallelLogger::addDefaultFileLogger(file.path(outputFolder, "log.txt"))
on.exit(ParallelLogger::unregisterLogger("DEFAULT"))
# DB CONNECTION
connection <- DatabaseConnector::connect(connectionDetails = connectionDetails)
# QUERY SQL
source(file.path(getwd(), "R/CreateCohortTables.R"))