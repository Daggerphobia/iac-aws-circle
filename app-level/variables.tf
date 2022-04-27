# variables.tf | Auth and Application variables
variable "vpc_tag_name" {}
variable "aws_cloudwatch_retention_in_days" {
  type        = number
  description = "AWS CloudWatch Logs Retention in Days"
  default     = 1
}

variable "aws_region" {}

variable "app_name" {}

variable "app_environment" {}