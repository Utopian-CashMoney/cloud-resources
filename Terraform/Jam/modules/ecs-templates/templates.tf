resource "aws_cloudformation_stack" "loans-microservice" {
    name = "loans-ms"
    capabilities = ["CAPABILITY_NAMED_IAM"]
    template_body = file("${path.module}/loansECS.yml")
}

resource "aws_cloudformation_stack" "branches-microservice" {
    name = "branches-ms"
    capabilities = ["CAPABILITY_NAMED_IAM"]
    template_body = file("${path.module}/branchesECS.yml")
}

resource "aws_cloudformation_stack" "user-microservice" {
    name = "user-ms"
    capabilities = ["CAPABILITY_NAMED_IAM"]
    template_body = file("${path.module}/userECS.yml")
}