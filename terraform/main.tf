module "network" {
  source                   = "./network"
  region                   = var.region
  vpc_cidr_mod_arg         = var.vpc_cidr_var
  pub_sub1_cidr_block_arg  = var.pub_sub1_cidr_block_var
  priv_sub1_cidr_block_arg = var.priv_sub1_cidr_block_var
  pub_sub2_cidr_block_arg  = var.pub_sub2_cidr_block_var
  priv_sub2_cidr_block_arg = var.priv_sub2_cidr_block_var

}
