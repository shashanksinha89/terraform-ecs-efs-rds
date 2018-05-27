resource "template_file" "demo-template" {
  template = "${file("./ecs/wordpress.json")}"

  vars {
    db_host     = "${var.rds-url}"
    db_name     = "${var.rds-dbname}"
    db_user     = "${var.rds-username}"
    db_password = "${var.rds-password}"
  }
}
