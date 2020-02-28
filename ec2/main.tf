provider "aws"  {
  region   = var.region
 }

provider "aws" {
  alias  = "usw2"
  
}

variable "region" {
  type = string
  default = "us-east-1"
   }

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "associate_public_ip" {
  type    = bool
  default = true
}



variable "tags" {
  type = map
  default = {
    us-east-1 = "image-1234"
    us-west-2 = "image-4567"
    ua = "local.list[3]"
  }
}

variable "letters" {
  
  default = ["Q", "A"]
}


variable "subnet" {
  type = string
default = "subnet-7e3fd71a"
  }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "test_instance_my_instance1" {
  ami                         = data.aws_ami.ubuntu.id
instance_type               = var.instance_type
   subnet_id                   = var.subnet
    associate_public_ip_address = var.associate_public_ip
    tags = merge({ "Name" = format("i.kravcuk-test -> %s -> %s", substr ("🤔🤷", 0,1), data.aws_ami.ubuntu.name) }, var.tags)
    timeouts {
    create = "10m"
    delete = "15m"
       }
  #tags = merge({ "Name" = "i.kravcuk"}, var.tags)
 }

variable "failover_replica_ip_configuration" {
  description = "The ip configuration for the failover replica instances."
  type = object ({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    
    require_ssl         = false
  }
}


resource "aws_ebs_volume" "ebs-volume_for_testing_terraform-AllowFullS3Access" {
  availability_zone = "us-east-1a"
        size = 1
  tags = merge({ "Name" = "i.kravcuk"}, var.tags)
    }



data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid       = "AllowFullS3Access"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}

# Our default security group to access
# the instances over SSH and HTTP
#resource "aws_security_group" "default" {
 # name        = "terraform_example"
  #description = "Used in the terraform"
  #vpc_id      = "vpc-596aa03e"
  # SSH access from anywhere
  #ingress {
   # from_port   = 22
    #to_port     = 22
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecr_repository" "foo" {
  name = "bar"
}

resource "aws_ecr_repository_policy" "foopolicy" {
  repository = "${aws_ecr_repository.foo.name}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}
