variable "kubernetes_resources_prefix" {
  description = "Kubernetes config file to use"
  type = string
  default = "test-"
}

variable "etcd_nodeport" {
  description = "etcd nodeport port"
  type = number
  default = 32379
}