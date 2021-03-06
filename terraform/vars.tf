####################################################################################################
# Variables defined for scripts 
####################################################################################################

variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AMIS" {
  type = map(string)
  default = {
    linux   = "ami-04505e74c0741db8d"
    bastion = "ami-04505e74c0741db8d"
    jenkins = "ami-04505e74c0741db8d"
    app     = "ami-04505e74c0741db8d"
  }
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_REGION_AZ" {
  type = map(string)
  default = {
    a = "us-east-1a"
    b = "us-east-1b"
  }
}

variable "KEY_NAME" {
  default = "terraform-key"
}

variable "KEY_PATH" {
  default = "terraform-key"
}

variable "CIDR_BLOCK" {
  type = map(string)
  default = {
    vpc                = "10.50.0.0/16"
    subnet_public_one  = "10.50.1.0/24"
    subnet_public_two  = "10.50.2.0/24"
    subnet_private_one = "10.50.3.0/24"
    subnet_private_two = "10.50.4.0/24"
  }
}

variable "alb_listener_rule_path_pattern_jenkins" {
  type    = list(string)
  default = ["/jenkins", "/jenkins/*"]
}

variable "alb_listener_rule_path_pattern_app" {
  type    = list(string)
  default = ["/app", "/app/*"]
}
