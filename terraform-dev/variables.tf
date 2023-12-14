variable "ami_id" {
    default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-0f71ff24ff99f1fdb"
}

variable "port" {
    default = 22
}

variable "cidr_block" {
    default = "10.0.0.0/24"
}