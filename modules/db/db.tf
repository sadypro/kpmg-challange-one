resource "aws_db_instance" "aroura_postgres" {
  identifier             = "kpmg-three-tier-architecture-rds"
  storage_type           = "gp2"
  engine                 = "aurora-postgresql"
  engine_version         = "13.3"
  name                   = "kpmg-db"
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids = ["${var.db_security_group}"]
  instance_class         = "${var.instance_class}"
  multi_az               = "${var.multi_az}"
  allocated_storage      = "${var.allocated_storage}"
  username               = "${var.username}"
  password               = "${var.password}"
  skip_final_snapshot    = "${var.skip_final_snapshot}"
}

resource "aws_db_subnet_group" "default" {
  subnet_ids = ["${var.db_subnet_b}", "${var.db_subnet_c}"]
}
