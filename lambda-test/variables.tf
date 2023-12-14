variable "env" {
  type    = string
}

variable "region" {
  default = "us-east-1"
  type    = string
}
variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}
variable "lambda_bucket_name" {
  type    = string
}

variable "s3_bucket" {
  type    = string
  default = "default"
}
variable "s3_key" {
  type    = string
  default = "default"
}
variable "pythonver"{
  type = string
  default = "python3.8"
}
variable "memory"{
    type = number
    default = 128
}
variable "timeout"{
    type = number
    default = 3
}