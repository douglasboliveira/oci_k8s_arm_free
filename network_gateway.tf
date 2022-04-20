resource "oci_core_internet_gateway" "oke_internet_gateway" {
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "oke_internet_gateway"
	enabled = "true"
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}

resource "oci_core_nat_gateway" "oke_nat_gateway" {
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "oke_nat_gateway"
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}

resource "oci_core_service_gateway" "oke_service_gateway" {
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "oke_service_gateway"
	services {
		#isso eh o id de todos os servicos de rede???
		service_id = "ocid1.service.oc1.iad.aaaaaaaam4zfmy2rjue6fmglumm3czgisxzrnvrwqeodtztg7hwa272mlfna"
	}
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}