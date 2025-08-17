
module "dev-infra" {
  source = "./app"
  env = "dev"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  instance_count = 1
  
}

module "stg-infra" {
  source = "./app"
  env = "stg"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  instance_count = 1
  
}
 
module "prod-infra" {
  source = "./app"
  env = "prod"
  ec2_ami_id = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  instance_count = 2
}