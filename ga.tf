resource "aws_globalaccelerator_accelerator" "ga-dev" {
  name            = "ga-dev"
  ip_address_type = "IPV4"
  enabled         = true

  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "ga-ire-dev"
  }
}

resource "aws_globalaccelerator_listener" "ga-listener-dev" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga-dev.id
  client_affinity = "NONE"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-groups-ire-dev" {
  listener_arn = aws_globalaccelerator_listener.ga-listener-dev.id
  endpoint_group_region = var.aws_region_ire

  endpoint_configuration {
    endpoint_id = aws_lb.first-alb-ire-dev.arn
    weight      = 100
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-groups-sin-dev" {
  listener_arn = aws_globalaccelerator_listener.ga-listener-dev.id
  endpoint_group_region = var.aws_region_sin

  endpoint_configuration {
    endpoint_id = aws_lb.sec-alb-sin-dev.arn
    weight      = 100
  }
}