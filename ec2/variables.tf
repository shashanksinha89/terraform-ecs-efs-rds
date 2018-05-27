//----------------------------------------------------------------------
// Shared Variables
//----------------------------------------------------------------------

variable "vpc-id" {}
variable "subnet-id-1" {}
variable "subnet-id-2" {}
variable "security-group-id" {}
variable "rds-security-group" {}
variable "ecs-cluster-name" {}
variable "ecs-instance-role-name" {}
variable "ecs-instance-profile-name" {}
variable "ecs-key-pair-name" {}


//----------------------------------------------------------------------
// Autoscaling Group Variables
//----------------------------------------------------------------------

variable "autoscaling-group-name" {
    description = "The name for the autoscaling group for the cluster."
    default     = "demo-ecs-asg"
}

variable "max-instance-size" {
    description = "The name for the autoscaling group for the cluster."
    default     = 4
}

variable "min-instance-size" {
    description = "The name for the autoscaling group for the cluster."
    default     = 1
}

variable "desired-capacity" {
    description = "The name for the autoscaling group for the cluster."
    default     = 1
}

variable "health-check-grace-period" {
    description = "The name for the autoscaling group for the cluster."
    default     = 300
}


//----------------------------------------------------------------------
// Launch Configuration Variables
//----------------------------------------------------------------------

variable "launch-configuration-name" {
    description = "The name for the autoscaling group for the cluster."
    default = "demo-ecs-launch-configuration"
}

variable "image-id" {
    description = "The name for the autoscaling group for the cluster."
    default = "ami-d61027ad"
}

variable "instance-type" {
    description = "The name for the autoscaling group for the cluster."
    default = "t2.medium"
}
