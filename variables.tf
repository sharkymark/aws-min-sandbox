

locals {
  # nuon dns
  enable_nuon_dns = contains(["1", "true"], var.enable_nuon_dns)
  nuon_dns = {
    enabled              = local.enable_nuon_dns
    internal_root_domain = var.internal_root_domain
    public_root_domain   = var.public_root_domain
  }

  # tags for all of the resources
  default_tags = merge(var.tags, {
    "install.nuon.co/id"   = var.nuon_id
    "sandbox.nuon.co/name" = "aws-ecs"
  })
  tags = merge(
    var.additional_tags,
    local.default_tags,
  )

  roles = {
    provision_iam_role_name   = split("/", var.provision_iam_role_arn)[length(split("/", var.provision_iam_role_arn)) - 1]
    deprovision_iam_role_name = split("/", var.deprovision_iam_role_arn)[length(split("/", var.deprovision_iam_role_arn)) - 1]
    maintenance_iam_role_name = split("/", var.maintenance_iam_role_arn)[length(split("/", var.maintenance_iam_role_arn)) - 1]
  }
}

#
# from cloudformation
#

variable "vpc_id" {
  type        = string
  description = "The ID of the AWS VPC to provision the sandbox in."
}

variable "maintenance_iam_role_arn" {
  type        = string
  description = "The provision IAM Role ARN"
}

variable "provision_iam_role_arn" {
  type        = string
  description = "The maintenance IAM Role ARN"
}

variable "deprovision_iam_role_arn" {
  type        = string
  description = "The deprovision IAM Role ARN"
}

# kyverno policies
variable "kyverno_policy_dir" {
  type        = string
  description = "Path to a directory with kyverno policy manifests."
  default     = "./kyverno-policies"
}

variable "additional_tags" {
  type        = map(any)
  description = "Extra tags to append to the default tags that will be added to install resources."
  default     = {}
}

variable "prefix_override" {
  type        = string
  description = "The resource prefix to override, otherwise defaults to the nuon install id"
  default     = ""
}

#
# toggle-able components
#

variable "enable_nuon_dns" {
  type        = string
  default     = "false"
  description = "Whether or not the app should use a nuon-provided nuon.run domain. Controls the cert-manager-issuer and the route_53_zone."
} 

#
# set by nuon
#

# Automatically set by Nuon when provisioned.
variable "nuon_id" {
  type        = string
  description = "The nuon id for this install. Used for naming purposes."
}

variable "region" {
  type        = string
  description = "The region to launch the cluster in."
}

variable "public_root_domain" {
  type        = string
  description = "The public root domain."
}

variable "internal_root_domain" {
  type        = string
  description = "The internal root domain."
}

variable "tags" {
  type        = map(any)
  description = "List of custom tags to add to the install resources. Used for taxonomic purposes."
}
