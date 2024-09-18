resource "aws_route53_record" "expense" {
    for_each = aws_instance.terraform
    zone_id = "Z01089512XQ8J5XJOKNVR"
    name = each.key == "frontend-prod" ? var.domain_name : "${each.key}.${var.domain_name}"
    ttl = 1
    type = "A"
    records = startswith(each.key,"frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true
}