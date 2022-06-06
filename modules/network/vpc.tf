# ------------------------------------------------------------------------------
# CONFIGURE OUR NETWORK
# ------------------------------------------------------------------------------

resource "aws_vpc" "kpmg_main_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "kpmg-main-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.kpmg_main_vpc.id}"

  tags {
    Name = "igw"
  }
}
