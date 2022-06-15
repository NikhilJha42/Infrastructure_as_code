# variable.tf
# create variables for resources

# ami, vpc, ec2, asg, subnet, ....

# Replace ami-some_number and key_name with your own.

variable "node_ami_id" {
    default = "ami-some_number"

}

variable "aws_key_name"{
  default = "key_name"
}

variable "aws_key_path" {
  default = "~/path/to/key_name"
}