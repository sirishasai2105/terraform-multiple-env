resource "aws_instance" "terraform" {
    ami = "ami-0b4f379183e5706b9"
    vpc_security_group_ids = ["sg-001753742e64eaea2"]
    instance_type = lookup(var.instance_type,terraform.workspace)
    tags = {
        Name = "terraform.${terraform.workspace}"
    }
}