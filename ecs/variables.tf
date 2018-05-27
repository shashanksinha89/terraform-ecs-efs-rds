
variable "ecs-target-group-arn" {}

variable "vpc-id" {}
variable "subnet-id-1" {}
variable "subnet-id-2" {}
variable "security-group-id" {}
variable "rds-security-group" {}
variable "rds-url" {}
variable "rds-username" {}
variable "rds-password" {}
variable "rds-dbname" {}
variable "efs-subnet-ids" {}

variable "ecs-alb-target" {
    default = "demo-ecs-target-group"
}

variable "ecs-cluster-name" {
    default = "demo-ecs-cluster"
}

variable "ecs-service-role-arn" {
    default = "demo-ecs-cluster"
}

variable "ecs-service-name" {
    default = "demo-ecs-service"
}

variable "ecs-load-balancer-name" {
    default = "demo-ecs-load-balancer"
}

//----------------------------------------------------------------------
// Application Load Balancer Variables
//----------------------------------------------------------------------

variable "load-balancer-name" {
    description = "The name for the autoscaling group for the cluster."
    default     = "demo-ecs-load-balancer"
}

variable "target-group-name" {
    description = "The name for the autoscaling group for the cluster."
    default     = "demo-ecs-target-group"
}
