
#module "networking" {
#  source = "./modules/networking"
#}

#module "user_website" {
#  source = "./modules/user-site"
#}

module "ecr" {
  source = "./modules/ecr"
}
