variable "subnet_id" {}
variable "project_name" {}
variable "instance_type" {}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
}
