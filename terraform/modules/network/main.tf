#####################################
# VPC
#####################################
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc["cidr_block"]}"
  enable_dns_hostnames = true
  enable_classiclink_dns_support = true
  instance_tenancy = "default"

  tags {
    "Name" = "${var.common["base_name"]}-vpc"
  }
}

#####################################
# InternetGW
#####################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    "Name" = "${var.common["base_name"]}-igw"
  }
}

#####################################
# RouteTable
#####################################
resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    "Name" = "${var.common["base_name"]}-public-route"
  }
}

#####################################
# Subnet
#####################################
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_a["cidr_block"]}"
  availability_zone       = "${var.common["region"]}${var.public_subnet_a["availability_zone"]}"
  map_public_ip_on_launch = true

  tags {
    "Name" = "${var.common["base_name"]}-public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_c["cidr_block"]}"
  availability_zone       = "${var.common["region"]}${var.public_subnet_c["availability_zone"]}"
  map_public_ip_on_launch = true

  tags {
    "Name" = "${var.common["base_name"]}-public-subnet-c"
  }
}

#####################################
# Subnet RouteTableAssociation
#####################################
resource "aws_route_table_association" "public_subnet_a" {
  subnet_id = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "public_subnet_c" {
  subnet_id = "${aws_subnet.public_subnet_c.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}
