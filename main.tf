provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
 
  allow_unverified_ssl = true
}
 
data "vsphere_datacenter" "dc" {
  name = "IZMV"
}
 
data "vsphere_datastore" "datastore" {
  name          = "SYSTEM"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_compute_cluster" "cluster" {
  name          = "VMWARE_HA"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_network" "network" {
  name          = "Servers"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
 
data "vsphere_virtual_machine" "template" {
  name          = "BaseTemplate-v.2.0"
  datacenter_id = "${data.vsphere_datacenter.dc.id}" 