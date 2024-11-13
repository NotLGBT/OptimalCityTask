resource "google_storage_bucket" "terraform_state" {
  name     = "324324424332gcs-bucket-name"         
  location = "EU"                           
  storage_class = "STANDARD"                

  versioning {
    enabled = true                          
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365                             
    }
  }
}