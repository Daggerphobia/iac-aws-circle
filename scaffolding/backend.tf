# terraform {
#   backend "s3" {
#     region = "eu-central-1"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "teststateiac"
#     key    = "Layer/scaffolding.state"
#     region = "eu-central-1"
#   }
# }

# terraform {
#   backend "local" {
#     path = "./iac-aws-terraform/scaffolding/terraform.tfstate"
#   }
# }
