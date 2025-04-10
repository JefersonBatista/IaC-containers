variable "name" {
  description = "The name of the Elastic Beanstalk application."
  type        = string
}

variable "description" {
  description = "The description of the Elastic Beanstalk application."
  type        = string
}

variable "environment" {
  description = "The name of the Elastic Beanstalk environment."
  type        = string
}

variable "machine" {
  description = "The machine type for the Elastic Beanstalk environment."
  type        = string
}

variable "max_size" {
  description = "The maximum size of the Elastic Beanstalk environment."
  type        = number
}
