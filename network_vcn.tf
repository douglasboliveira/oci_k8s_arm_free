resource "oci_core_vcn" "oke_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "oke-vcn"
	#dns_label = "cluster-oke"
}