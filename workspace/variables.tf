variable "instance_type" {
    type = map
    default = {
        dev = "t3.micro"
        prod = "t3.small"
        qa = "t3.large"

    }
}