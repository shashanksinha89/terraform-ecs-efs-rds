provider "aws" {
  region = "us-east-1"
}

module "iam" {
    source = "./iam"
}

module "vpc" {
    source = "./vpc"
}



module "ec2" {
    source = "./ec2"

    vpc-id                      = "${module.vpc.id}"
    security-group-id           = "${module.vpc.security-group-id}"
    rds-security-group          = "${module.rds.db_access_sg_id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
    ecs-instance-role-name      = "${module.iam.ecs-instance-role-name}"
    ecs-instance-profile-name   = "${module.iam.ecs-instance-profile-name}"
    ecs-cluster-name            = "${var.ecs-cluster-name}"
    ecs-key-pair-name           = "${var.ecs-key-pair-name}"
}

module "rds" {
  source            = "./rds"
  environment       = "production"
  allocated_storage = "20"
  database_name     = "${var.production_database_name}"
  database_username = "${var.production_database_username}"
  database_password = "${var.production_database_password}"
  subnet_ids        = ["${module.vpc.subnet1-id}", "${module.vpc.subnet2-id}"]
  vpc_id            = "${module.vpc.id}"
  instance_class    = "db.t2.micro"
}

module "ecs" {
    source = "./ecs"

    vpc-id                      = "${module.vpc.id}"
    rds-url                     = "${module.rds.rds_address}"
    rds-username                = "${module.rds.rds_user}"
    rds-password                = "${module.rds.rds_password}"
    rds-dbname                  = "${var.production_database_name}"
    security-group-id           = "${module.vpc.security-group-id}"
    rds-security-group          = "${module.rds.db_access_sg_id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
    efs-subnet-ids              = "${module.vpc.subnet1-id},${module.vpc.subnet2-id}"
    ecs-cluster-name            = "${var.ecs-cluster-name}"
    #ecs-load-balancer-name      = "${module.ec2.ecs-load-balancer-name}"
    ecs-target-group-arn        = "${module.ecs.ecs-target-group-arn}"
    ecs-service-role-arn        = "${module.iam.ecs-service-role-arn}"
}
