variable "name" {
    type = string
    description = "Name of resource group to be created"
    default = "ansible-jenkins-terraform-cicd"
}
variable "location" {
    type = string
    description = "Location used to provision resourcegroup"
}
variable "subscription_id" {
    type = string
}