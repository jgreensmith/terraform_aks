variable "resource_group_name" {
    description = "The name of the Azure Resource Group"
    type        = string
    default = "tfresgroup"
}

variable "resource_group_location" {
    description = "The location/region of the Azure Resource Group"
    type        = string
    default     = "North Europe" # You can change the default value as needed
}
variable "kubernetes_version" {
    description = "The version of Kubernetes to use for the AKS cluster"
    type        = string
    default     = "1.32"
}
variable "cluster_name" {
    description = "The name of the AKS cluster"
    type        = string
    default     = "tf-captain-cluster"
}