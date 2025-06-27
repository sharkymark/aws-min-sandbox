# Nuon AWS Empty Sandbox
This is a baseline sandbox that provides a bare minimum AWS environment for use with Nuon.

It includes outputs required for Nuon to function.

== Requirements

[cols="a,a",options="header,autowidth"]
|===
|Name |Version
|[[requirement_terraform]] <<requirement_terraform,terraform>> |>= 1.7.5
|[[requirement_aws]] <<requirement_aws,aws>> |>= 5.86.1
|===

== Providers

[cols="a,a",options="header,autowidth"]
|===
|Name |Version
|[[provider_aws]] <<provider_aws,aws>> |>= 5.86.1
|===

== Modules

[cols="a,a,a",options="header,autowidth"]
|===
|Name |Source |Version
|[[module_ecr]] <<module_ecr,ecr>> |terraform-aws-modules/ecr/aws |>= 2.4.0
|===

== Resources

[cols="a,a",options="header,autowidth"]
|===
|Name |Type
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy[aws_iam_policy.ecr_access] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment[aws_iam_role_policy_attachment.ecr_access_deprovision] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment[aws_iam_role_policy_attachment.ecr_access_maintenance] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment[aws_iam_role_policy_attachment.ecr_access_provision] |resource
|https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document[aws_iam_policy_document.ecr] |data source
|===

== Inputs

[cols="a,a,a,a,a",options="header,autowidth"]
|===
|Name |Description |Type |Default |Required
|[[input_additional_tags]] <<input_additional_tags,additional_tags>>
|Extra tags to append to the default tags that will be added to install resources.
|`map(any)`
|`{}`
|no

|[[input_deprovision_iam_role_arn]] <<input_deprovision_iam_role_arn,deprovision_iam_role_arn>>
|The deprovision IAM Role ARN
|`string`
|n/a
|yes

|[[input_enable_nuon_dns]] <<input_enable_nuon_dns,enable_nuon_dns>>
|Whether or not the cluster should use a nuon-provided nuon.run domain.
|`string`
|`"false"`
|no

|[[input_internal_root_domain]] <<input_internal_root_domain,internal_root_domain>>
|The internal root domain.
|`string`
|n/a
|yes

|[[input_maintenance_iam_role_arn]] <<input_maintenance_iam_role_arn,maintenance_iam_role_arn>>
|The provision IAM Role ARN
|`string`
|n/a
|yes

|[[input_nuon_id]] <<input_nuon_id,nuon_id>>
|The nuon id for this install. Used for naming purposes.
|`string`
|n/a
|yes

|[[input_prefix_override]] <<input_prefix_override,prefix_override>>
|The resource prefix to override, otherwise defaults to the nuon install id
|`string`
|`""`
|no

|[[input_provision_iam_role_arn]] <<input_provision_iam_role_arn,provision_iam_role_arn>>
|The maintenance IAM Role ARN
|`string`
|n/a
|yes

|[[input_public_root_domain]] <<input_public_root_domain,public_root_domain>>
|The public root domain.
|`string`
|n/a
|yes

|[[input_tags]] <<input_tags,tags>>
|List of custom tags to add to the install resources. Used for taxonomic purposes.
|`map(any)`
|n/a
|yes

|===

== Outputs

No outputs.
