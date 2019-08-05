#####################################
# Application Road Barancer
#####################################
resource "aws_lb" "alb" {
  name = "${var.alb["name"]}"
  internal = false
  load_balancer_type = "application"
  subnets = [
    "${var.vpc_zone_identifier}"]
  security_groups = [
    "${aws_security_group.security_group.id}"]
}

resource "aws_lb_target_group" "alb_target_group" {
  name = "${var.target_group["name"]}"
  port = "${var.target_group["port"]}"
  protocol = "${var.target_group["protocol"]}"
  vpc_id = "${var.target_group["vpc_id"]}"
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {
  target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
  target_id = "${var.target_group_attachment["target_id"]}"
  port = "${var.target_group_attachment["port"]}"
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = "${var.listener["port"]}"
  protocol = "${var.listener["protocol"]}"
  ssl_policy = "${var.listener["ssl_policy"]}"
  certificate_arn = "${var.listener["certificate_arn"]}"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
  }
}

resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = "${var.http_listener["port"]}"
  protocol = "${var.http_listener["protocol"]}"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
  }
}

resource "aws_lb_listener_rule" "alb_http_listener_rule" {
  listener_arn = "${aws_lb_listener.alb_http_listener.arn}"

  action {
    type = "redirect"
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    field = "path-pattern"
    values = ["*"]
  }
  depends_on = ["aws_lb_listener.alb_http_listener"]
}

#####################################
# Security Group
#####################################
resource "aws_security_group" "security_group" {
  name = "${var.security_group["name"]}-sg"
  description = "${var.security_group["description"]}-sg"
  vpc_id = "${var.security_group["vpc_id"]}"

  tags {
    "Name" = "${var.security_group["name"]}-sg"
  }
}

resource "aws_security_group_rule" "security_group_rule" {
  count = "${length(var.security_group_rule["description"])}"
  description = "${element(var.security_group_rule["description"], count.index)}"
  security_group_id = "${aws_security_group.security_group.id}"
  type = "${element(var.security_group_rule["type"], count.index)}"
  from_port = "${element(var.security_group_rule["from_port"], count.index)}"
  to_port = "${element(var.security_group_rule["to_port"], count.index)}"
  protocol = "${element(var.security_group_rule["protocol"], count.index)}"
  cidr_blocks = [
    "${element(var.security_group_rule["cidr_blocks"], count.index)}"]
  self = "${element(var.security_group_rule["self"], count.index)}"
}
