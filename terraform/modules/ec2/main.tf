#####################################
# EC2 Instance
#####################################
resource "aws_instance" "ec2" {
  ami = "${var.ec2["ami"]}"
  instance_type = "${var.ec2["instance_type"]}"
  iam_instance_profile = "${var.ec2["iam_instance_profile"]}"
  key_name = "${var.ec2["key_name"]}"

  associate_public_ip_address = "${var.ec2["associate_public_ip_address"]}"
  vpc_security_group_ids = [
    "${aws_security_group.security_group.id}"
  ]
  subnet_id = "${var.ec2["subnet_id"]}"

  tags {
    Name = "${var.ec2["tag_name"]}"
    AutoStop = true
    monitoring = "${var.ec2["monitoring"]}"
    env = "${var.common["env"]}"
  }
}

#####################################
# EIP
#####################################
resource "aws_security_group" "security_group" {
  name        = "${var.security_group["name"]}"
  description = "${var.security_group["description"]}-sg"
  vpc_id      = "${var.security_group["vpc_id"]}"

  tags {
    "Name" = "${var.security_group["name"]}"
  }
}

resource "aws_security_group_rule" "security_group_rule" {
  count             = "${length(var.security_group_rule["description"])}"
  description       = "${element(var.security_group_rule["description"], count.index)}"
  security_group_id = "${aws_security_group.security_group.id}"
  type              = "${element(var.security_group_rule["type"], count.index)}"
  from_port         = "${element(var.security_group_rule["from_port"], count.index)}"
  to_port           = "${element(var.security_group_rule["to_port"], count.index)}"
  protocol          = "${element(var.security_group_rule["protocol"], count.index)}"
  cidr_blocks       = ["${element(var.security_group_rule["cidr_blocks"], count.index)}"]
  self              = "${element(var.security_group_rule["self"], count.index)}"
}