resource "oci_core_subnet" "service_public_subnet" {
	cidr_block = "10.0.0.0/28"
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "public network para cluster oke - k8s api endpoint"
	#dns_label = "public_oke"
	prohibit_public_ip_on_vnic = "false"
	route_table_id = "${oci_core_default_route_table.oke_core_default_route_table.id}"
	security_list_ids = ["${oci_core_security_list.kubernetes_api_endpoint_sec_list.id}"]
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}