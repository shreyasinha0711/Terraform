resource "aws_lb_target_group" "first-tg-ire-dev" {
  name        = "first-tg-ire-dev"
  target_type = "lambda"
  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "first-tg-ire-dev"
  }
}

resource "aws_lambda_permission" "first-lpermission-ire-dev" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.first-lambda-ire-dev.arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.first-tg-ire-dev.arn
}

resource "aws_lb_target_group_attachment" "first-tg-attach-ire-dev" {
  target_group_arn = aws_lb_target_group.first-tg-ire-dev.arn
  target_id        = aws_lambda_function.first-lambda-ire-dev.arn
  depends_on       = [aws_lambda_permission.first-lpermission-ire-dev]
}

resource "aws_lb_target_group" "sec-tg-ire-dev" {
  name        = "sec-tg-ire-dev"
  target_type = "lambda"
  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "sec-tg-ire-dev"
  }
}

resource "aws_lambda_permission" "sec-lpermission-ire-dev" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sec-lambda-ire-dev.arn
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.sec-tg-ire-dev.arn
}

resource "aws_lb_target_group_attachment" "sec-tg-attach-ire-dev" {
  target_group_arn = aws_lb_target_group.sec-tg-ire-dev.arn
  target_id        = aws_lambda_function.sec-lambda-ire-dev.arn
  depends_on       = [aws_lambda_permission.sec-lpermission-ire-dev]
}

resource "aws_lb" "first-alb-ire-dev" {
  name               = "first-alb-ire-dev"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id_web_world_ire, var.security_group_id_default_ire]
  subnets = [ data.aws_subnet.subnet_id_1_public_ire.id , data.aws_subnet.subnet_id_2_public_ire.id , data.aws_subnet.subnet_id_3_public_ire.id ]
  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "sec-lambda-ire-dev"
  }
}

resource "aws_lb_listener" "alb-listener-ire-dev" {
  load_balancer_arn = aws_lb.alb-ire-dev.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.first-tg-ire-dev.arn
  }
}

resource "aws_lb_listener_rule" "first-alb-lrule-ire-dev" {
  listener_arn = "${aws_lb_listener.alb-listener-ire-dev.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.first-tg-ire-dev.arn}"
  }

  condition {
    path_pattern {
      values = ["/first"]
    }
  }
}

resource "aws_lb_listener_rule" "sec-alb-lrule-ire-dev" {
  listener_arn = "${aws_lb_listener.alb-listener-ire-dev.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.sec-tg-ire-dev.arn}"
  }

  condition {
    path_pattern {
      values = ["/second"]
    }
  }
}