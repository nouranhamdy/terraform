# resource "aws_lb" "loadbalancer" {
#   name               = "lb-tf"
#   internal           = false
#   load_balancer_type = "network"
#   subnets            = [module.network.public-subnet-01-id]

#   enable_deletion_protection = false

#   tags = {
#     name = "app-loadbalancer"
#   }
# }

# resource "aws_lb_listener" "app_lb_lestener" {
#   load_balancer_arn = aws_lb.loadbalancer.arn
#   port              = "80"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.app_lb_tg.arn
#   }
# }

# resource "aws_lb_target_group" "app_lb_tg" {
#   name     = "app-lb-tg"
#   port     = 3000
#   protocol = "TCP"
#   vpc_id   = module.network.vpc-id
# }

# resource "aws_lb_target_group_attachment" "app_lb_tg_att" {
#   target_group_arn = aws_lb_target_group.app_lb_tg.arn
#   target_id        = aws_instance.ec2.id
#   port             = 3000
# }