install.packages('googleComputeEngineR')

library(googleComputeEngineR)

vm <- gce_vm("test-geospatial", 
             predefined_type = "n1-standard-1", 
             template = "rstudio", 
             username = "test", 
             password = "test1234", 
             disk_size_gb = 50,
             dynamic_image = gce_tag_container("geospatial_4.0.4", project = "satellite-data-297301"))

vm <- gce_vm("im-rstudio", 
             predefined_type = "n1-standard-1", 
             template = "rstudio", 
             username = "test", 
             password = "test1234", 
             dynamic_image = gce_tag_container("test-trigger", project = "satellite-data-297301"))

#authenticate inside instance
googleAuthR::gar_auth(email = "frzambra@gmail.com")
googleAuthR::gar_gce_auth()
gcs_get_bucket('sentinel1-chile')