# Terraform ECS Cluster

This repository contains `Terrorform` configuration files to deploy data-persistent `wordpress` application based on `ECS` hosted across multiple AWS zones.
## AWS Components


* [Amazon ECS](https://aws.amazon.com/ecs/)
* [Amazon RDS](https://aws.amazon.com/rds/)
* [Amazon EFS](https://aws.amazon.com/efs/)
* [Amazon EC2](https://aws.amazon.com/ec2/)
* [Amazon VPC](https://aws.amazon.com/vpc/)
* [Amazon ELB](https://aws.amazon.com/es/elasticloadbalancing/)
* [Amazon IAM](https://aws.amazon.com/iam/)

## Requirements

To use this example you will need an [AWS](https://aws.amazon.com/es/) account and:

Export AWS Credentials or AWS profile.

```
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

```
If you are maintaining multiple aws profile, export required [AWS Named profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)

```
export AWS_PROFILE=your_profile_name

```

* [Terraform](https://www.terraform.io/downloads.html)



## Use

* Update values accordingly for cluster in variable.tf

```
variable "ecs-cluster-name" {
    description = "The name for the cluster."
    default = "demo-ecs-cluster"
}

variable "ecs-key-pair-name" {
    description = "The name for the cluster."
    default = "demo"
}

```

* RDS details are mentioned terraform.tavars

```
production_database_name      = "dummy_data"
production_database_username  = "demo"
production_database_password  = "defaultpassword"

```

* Deploy all the infrastructure needed on AWS using Terraform.

```
# terraform get
# terraform init
# terraform plan -out config
# terraform apply config

```

 Once deployed, open `ALB DNS` on browser. It will start the wordpress application setup.

The RDS connection parameters will be passed on runtime to the Wordpress containers via environment variables.

* Once not needed, we can remove all the AWS infrastructure:


```
# terraform destroy
```

* To deploy individual AWS components:

Configure a new VPC.

```
terraform apply -target=module.vpc
```

Configure a new ECS Cluster with a service.

```
terraform apply -target=module.ecs
```

Configure the auto scaling group and launch configuration via EC2.

```
terraform apply -target=module.ec2
```

Configure and launch RDS.

```
terraform apply -target=module.rds
```

## Author
[**Shashank Sinha**] <sinha.shashank.1989@gmail.com>
