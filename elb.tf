resource "aws_elb" "internal_fiap_fast_food_elb" {
    name                    = "fiap-fast-food-elb"
    subnets                 = [
        aws_subnet.subnet-msv-1a.id,
        aws_subnet.subnet-msv-1b.id
    ]

    listener {
        instance_port       = 8080
        instance_protocol   = "http"
        lb_port             = 80
        lb_protocol         = "http"
    }

    internal                = true
}

#resource "aws_elb" "external_fiap_fast_food_elb" {
#    name                    = "external-fiap-fast-food-elb"
#    subnets                 = [
#        aws_subnet.subnet-msv-1ap.id,
#        aws_subnet.subnet-msv-2ap.id
#    ]
#
#    listener {
#        instance_port       = 8000
#        instance_protocol   = "http"
#        lb_port             = 80
#        lb_protocol         = "http"
#    }
#}