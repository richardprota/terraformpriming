variable "ami_id" {
    default = "ami-0c2d06d50ce30b442"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-bc102dc4"
}

variable "port" {
    default = 22
}

variable "cidr_block" {
    default = "0.0.0.0/0"
}