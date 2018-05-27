resource "aws_ecs_cluster" "demo-ecs-cluster" {
    name = "${var.ecs-cluster-name}"
}
