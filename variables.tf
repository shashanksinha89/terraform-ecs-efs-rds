variable "ecs-cluster-name" {
    description = "The name for the cluster."
    default = "demo-ecs-cluster"
}

variable "ecs-key-pair-name" {
    description = "The name for the cluster."
    default = "demo"
}

/*====
environment specific variables
======*/

variable "production_database_name" {
  description = "The database name for Production"
}

variable "production_database_username" {
  description = "The username for the Production database"
}

variable "production_database_password" {
  description = "The user password for the Production database"
}
