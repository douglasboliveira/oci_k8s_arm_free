resource "oci_core_subnet" "service_private_subnet" {
	cidr_block = "10.0.10.0/24"
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "private network para cluster oke - nodes"
	#dns_label = "private_oke"
	prohibit_public_ip_on_vnic = "true"
	route_table_id = "${oci_core_route_table.oke_core_route_table.id}"
	security_list_ids = ["${oci_core_security_list.node_sec_list.id}"]
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}