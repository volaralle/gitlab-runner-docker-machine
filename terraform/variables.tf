variable "cloud_id" {
  description = "cloud_id variable"
  type        = string
}

variable "folder_id" {
  description = "folder_id variable"
  type        = string
}

variable "zone" {
  description = "zone variable"
  type        = string
}

variable "vm_yc_name" {
  description = "name of vm in yc"
  type        = string
}

variable "image_id" {
  description = "image_id variable"
  type        = string
}

variable "size_vm" {
  description = "size_vm storage"
  type        = number
}

variable "cores" {
  description = "num of cpu cores"
  type        = number
}

variable "ram" {
  description = "ram variable"
  type        = number
}

variable "network_id" {
  description = "network_id variable"
  type        = string
}

variable "subnet_id" {
  description = "subnet_id variable"
  type        = string
}

variable "ip_address" {
  description = "internal ip_address"
  type        = string
}

variable "sg_name" {
  description = "sec group name"
  type        = string
}
