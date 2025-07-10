# aws_lb
resource "aws_lb" "web_lb" {
  name               = "web-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx-sg.id]
  subnets            = [aws_subnet.subnet1.id,aws_subnet.public_subnet2.id]

  enable_deletion_protection = false

  tags = local.common_tags
  }

# aws_lb_target_group
resource "aws_lb_target_group" "nginx" {
  name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  tags = local.common_tags
}
# aws_lb_listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }

    tags = local.common_tags
}
# aws_lb_target_group_attachment
resource |"aws_lb_target_group_attachment" "nginx" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx1.id
  port             = 80

  depends_on = [aws_lb_listener.nginx]

  resource |"aws_lb_target_group_attachment" "nginx" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx1.id
  port             = 80
  depends_on = [aws_lb_listener.nginx]
  tags = local.common_tags
}