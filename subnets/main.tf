variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_info" {
  description = "List of subnet information"
  type        = list(object({
    cidr_block         = string
    availability_zone = string
  }))
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet_info)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_info[count.index].cidr_block
  availability_zone       = var.subnet_info[count.index].availability_zone
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}