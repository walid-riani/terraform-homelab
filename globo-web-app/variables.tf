variable "aws_region" {
  type        = string
  description = "AWS region to use for resources"
  default     = "us-east-1"

}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "t2.micro"

}

variable "company" {
  type        = string
  description = "Company name for tagging resources"
  default     = "Globomantics"

}


