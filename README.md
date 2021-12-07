<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_a_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_to_public_subnet_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_to_internet_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.igw_for_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_rt_for_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet_gw_name"></a> [internet\_gw\_name](#input\_internet\_gw\_name) | The Name of my Internet Gatewat | `string` | n/a | yes |
| <a name="input_private_a_cidr"></a> [private\_a\_cidr](#input\_private\_a\_cidr) | CIDR of the private Subnet in AZ A | `string` | n/a | yes |
| <a name="input_public_a_cidr"></a> [public\_a\_cidr](#input\_public\_a\_cidr) | CIDR of the public Subnet in AZ A | `string` | n/a | yes |
| <a name="input_public_b_cidr"></a> [public\_b\_cidr](#input\_public\_b\_cidr) | CIDR of the public Subnet in AZ B | `string` | n/a | yes |
| <a name="input_public_c_cidr"></a> [public\_c\_cidr](#input\_public\_c\_cidr) | CIDR of the public Subnet in AZ C | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default region for our VPC | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR of my VPC | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The Name of my VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->