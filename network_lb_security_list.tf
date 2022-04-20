resource "oci_core_security_list" "service_lb_sec_list" {
    compartment_id = oci_identity_compartment.oke-compartment.id
    display_name = "oke lb security list"
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}