locals { // constants
    data_lake_bucket = "dtc_data_lake"
}

variable "project" { // passed at runtime
    description = "Your Project ID"
}

variable "region" {
    description = "Region for GCP resources. Chose as per your location"
    default = "europe-west6"
    type = string
}

variable "bucket_name" {
    description = "The name of GCS bucket. Must be globally unique"
    default = ""
}

variable "storage_class" {
    description = "Storage class type of your bucket"
    default = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery DataSet that raw data (from GCS) will be written to"
  type = string
  default = "trip_data_all"
}

variable "TABLE_NAME" {
  description = "BigQuery Table"
  type = string
  default = "ny_trips"
}