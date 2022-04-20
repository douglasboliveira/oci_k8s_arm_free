resource "oci_core_route_table" "oke_core_route_table" {
	compartment_id = oci_identity_compartment.oke-compartment.id
	display_name = "oke-private-routetable"
	route_rules {
		description = "traffic to the internet"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_nat_gateway.oke_nat_gateway.id}"
	}
	route_rules {
		description = "traffic to OCI services"
		destination = "all-iad-services-in-oracle-services-network"
		destination_type = "SERVICE_CIDR_BLOCK"
		network_entity_id = "${oci_core_service_gateway.oke_service_gateway.id}"
	}
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}

resource "oci_core_default_route_table" "oke_core_default_route_table" {
	display_name = "oke-public-routetable"
	route_rules {
		description = "traffic to/from internet"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_internet_gateway.oke_internet_gateway.id}"
	}
	manage_default_resource_id = "${oci_core_vcn.oke_core_vcn.default_route_table_id}"
}