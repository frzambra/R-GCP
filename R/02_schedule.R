library(googleAuthR)         ## authentication
library(googleCloudStorageR) ## google cloud storage

something <- mtcars

## authenticate on GCE for google cloud services
gcs_auth('token/auth_gcs.json')

tmp <- tempfile(fileext = ".csv")
on.exit(unlink(tmp))
write.csv(something, file = tmp, row.names = FALSE)
## upload something
gcs_upload(mtcars, 
           bucket = "test-54321", 
           name = "test.csv")
