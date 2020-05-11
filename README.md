# Terraform configuration template (Draft)
Terraform으로 AWS인프라 구축시 마다 반복 사용되던 리소스들을 Terraform registry 중 Hashicorp 공인 파트너사에서 제공하는 모듈로 정의, 간단한 IaC 프로젝트를 위한 탬플릿으로 활용하고자 합니다.
 
>- 리소스는 Root module(Root directory)에 개별 파일로 정의.
>- 공식 모듈이 존재하지 않거나 프로젝트에 적합하지 않은 경우 /modules에 직접 정의하며 local path를 통해 사용.

### Prerequisite
- AWS Profile
- Terraform CLI

### Region: us-east-1 (N.Virginia)

## Modules
| Name | Desc. | Type |
|------|-------|--------------------|
| VPC | https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws | Hashicorp verified |

## Resources

### VPC
CIDR: 10.0.0.0/16
Public subnets: ["10.0.1.0/24", "10.0.2.0/24"]
Private subnets: ["10.0.11.0/24", "10.0.12.0/24"]
NAT Gateway: 개별 public subnet에 각각 생성.

### Security Groups
| Name | Desc. | Port |
|------|-------|------|
| sg_http | 0.0.0.0/0 허용 | 80 |
| sg_https | 0.0.0.0/0 허용 | 443 |
| sg_ssh | 0.0.0.0/0 허용 | 22 |

### Bastion server
EIP를 사용하며 public subnets 중 하나에 배치.
- t2.micro
- hvm-ssd타입 ubuntu 20.04 LTS AMI
- url: bation-[var.env].[var.domain]

