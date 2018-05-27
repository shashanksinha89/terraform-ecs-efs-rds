resource "aws_alb" "ecs-load-balancer" {
    name                = "${var.load-balancer-name}"
    security_groups     = ["${var.security-group-id}"]
    subnets             = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
}


resource "aws_alb_target_group" "ecs-target_group" {
    name                = "${var.target-group-name}"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${var.vpc-id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target_group.arn}"
        type             = "forward"
    }
}

output "ecs-load-balancer-name" {
  value = "${aws_alb.ecs-load-balancer.name}"
}

output "ecs-target-group-arn" {
  value = "${aws_alb_target_group.ecs-target_group.arn}"
}

resource "aws_efs_file_system" "wordpress-data" {
  creation_token = "es-persistent-data"
  performance_mode = "generalPurpose"

  tags {
    Name = "wordpress-data"
  }
}

resource "aws_efs_mount_target" "wordpress" {
  count  = "2"
  file_system_id = "${aws_efs_file_system.wordpress-data.id}"
  subnet_id      = "${element(split(",", var.efs-subnet-ids), count.index )}"
}

resource "aws_ecs_service" "demo-ecs-service" {
  	name            = "${var.ecs-service-name}"
  	iam_role        = "${var.ecs-service-role-arn}"
  	cluster         = "${aws_ecs_cluster.demo-ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.demo-sample-definition.arn}"
  	desired_count   = 1
    depends_on      = ["aws_alb_listener.alb-listener"]

  	load_balancer {
    	#target_group_arn  = "${var.ecs-target-group-arn}"
      target_group_arn  = "${var.ecs-target-group-arn}"
      container_port    = 80
    	container_name    = "wordpress-app"
	}

}
