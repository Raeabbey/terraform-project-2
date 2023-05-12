variable "region" {
  type        = string
  default     = ""
  description = "Name of the region"
}

variable "most_recent_ami" {
  type        = bool
  default     = true
  description = "Fetch the most recent AMI"
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "The list of available availability zones in the AWS region."
}

# variable "tags" {
#   type        = string
#   default     = ""
#   description = "The name tag for the EC2 instance"
# }

variable "instance_type" {
  type        = string
  default     = ""
  description = "instance type for our ec2 instance"
}

variable "key_pair" {
  type = string
  description = "The key pair for my Ec2 instance"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = list(string)
  default     = []
  description = "CIDR block for my first public subnet"
}


variable "private_subnet_cidr" {
  type        = list(string)
  default     = []
  description = "CIDR block for my first private subnet"
}
