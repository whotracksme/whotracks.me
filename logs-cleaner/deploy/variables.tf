variable "aws_region" {
  default = "us-east-1"
}
variable "aws_profile" {
  default = "cliqz-primary"
}

variable "tag_Owner" {
  description = "Used to tag AWS resouces. By convention, use <yourname>@cliqz.com"
  default     = "sam@cliqz.com"
}

variable "tag_Project" {
  description = "Used to tag AWS resouces."
  default     = "whotracks.me"
}

variable "function_Name" {
  description = "Used to name the function"
  default     = "clean-who-tracks-me-logs"
}
