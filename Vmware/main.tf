provider "vsphere" {
  allow_unverified_ssl = true
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vcenter_server
}

data "vsphere_datacenter" "dc" {
  name = "DC1"
}

resource "vsphere_folder" "folder" {
  path = "Scalr Sandbox/test_folder1"
  type = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}


