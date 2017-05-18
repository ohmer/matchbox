variable "matchbox_http_endpoint" {
  type        = "string"
  description = "Matchbox HTTP read-only endpoint (e.g. http://matchbox.example.com:8080)"
}

variable "matchbox_rpc_endpoint" {
  type        = "string"
  description = "Matchbox gRPC API endpoint, without the protocol (e.g. matchbox.example.com:8081)"
}

variable "container_linux_channel" {
  type        = "string"
  description = "Container Linux channel corresponding to the container_linux_version"
}

variable "container_linux_version" {
  type        = "string"
  description = "Container Linux version of the kernel/initrd to PXE or the image to install"
}

variable "cluster_name" {
  type        = "string"
  description = "Cluster name"
}

variable "ssh_authorized_key" {
  type        = "string"
  description = "SSH public key to set as an authorized_key on machines"
}

# Machines
# Terraform's crude "type system" does properly support lists of maps so we do this.

variable "controller_names" {
  type = "list"
}

variable "controller_macs" {
  type = "list"
}

variable "controller_domains" {
  type = "list"
}

variable "worker_names" {
  type = "list"
}

variable "worker_macs" {
  type = "list"
}

variable "worker_domains" {
  type = "list"
}

# bootkube assets

variable "k8s_domain_name" {
  description = "Controller DNS name which resolves to a controller instance. Workers and kubeconfig's will communicate with this endpoint (e.g. cluster.example.com)"
  type        = "string"
}

variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}

variable "pod_cidr" {
  description = "CIDR IP range to assign Kubernetes pods"
  type        = "string"
  default     = "10.2.0.0/16"
}

variable "service_cidr" {
  description = "CIDR IP range to assign Kubernetes services"
  type        = "string"
  default     = "10.3.0.0/16"
}

variable "k8s_apiserver_service_ip" {
  description = "Kubernetes service IP for kube-apiserver (must be within service_cidr)"
  type        = "string"
  default     = "10.3.0.1"
}

variable "k8s_dns_service_ip" {
  description = "Kubernetes service IP for kube-dns (must be within server_cidr)"
  type        = "string"
  default     = "10.3.0.10"
}

variable "k8s_etcd_service_ip" {
  type        = "string"
  default     = "10.3.0.15"
  description = "Kubernetes service IP for self-hosted etcd, if enabled (must be within service_cidr)"
}

variable "container_linux_oem" {
  type        = "string"
  default     = ""
  description = "Specify an OEM image id to use as base for the installation (e.g. ami, vmware_raw, xen) or leave blank for the default image"
}

variable "experimental_self_hosted_etcd" {
  default     = "false"
  description = "Create self-hosted etcd cluster as pods on Kubernetes, instead of on-hosts"
}