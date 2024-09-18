resource "aws_security_group" "siri" {
    name = "security_group_${var.environment}"
    description = "allows all ports"
    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    dynamic "ingress" {
        for_each = [22,80,8080]
        iterator = port
        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    tags = {
        Name = "sg-${var.environment}"
        

    }
}

resource "aws_instance" "terraform" {
    for_each = var.instances
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.siri.id]
    instance_type = each.value
    tags = {
        Name = each.key

    }

}