locals {
  internal_domain = aws_route53_zone.internal.name
  public_domain   = aws_route53_zone.public.name
  external_dns = {
    namespace = "external-dns"
    name      = "external-dns"
    extra_args = {
      0 = "--publish-internal-services",
      1 = "--zone-id-filter=${aws_route53_zone.internal.id}",
      2 = "--zone-id-filter=${aws_route53_zone.public.id}",
    }
    value_file = "${path.module}/values/external-dns.yaml"
  }
}


module "external_dns_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "external-dns-${var.nuon_id}"

  attach_external_dns_policy = true
  external_dns_hosted_zone_arns = [
    aws_route53_zone.internal.arn,
    aws_route53_zone.public.arn,
  ]

  oidc_providers = {
    ex = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["${local.external_dns.namespace}:external-dns"]
    }
  }

  tags = var.tags
}