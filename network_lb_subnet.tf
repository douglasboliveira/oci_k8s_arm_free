resource "oci_core_subnet" "service_lb_subnet" {
	cidr_block = "10.0.20.0/24"
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "load balancer para cluster oke"
	#dns_label = "lb_oke"
	prohibit_public_ip_on_vnic = "false"
	route_table_id = "${oci_core_default_route_table.oke_core_default_route_table.id}"
	security_list_ids = ["${oci_core_vcn.oke_core_vcn.default_security_list_id}"]
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}