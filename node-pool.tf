resource "oci_containerengine_node_pool" "oke-node-pool" {
    cluster_id = "${oci_containerengine_cluster.oke-cluster.id}"
	compartment_id = oci_identity_compartment.oke-compartment.id
	freeform_tags = {
		"OKEnodePoolName" = "pool1"
	}
	initial_node_labels {
		key = "name"
		value = "oke-cluster"
	}
	kubernetes_version = "v1.22.5"
	name = "pool1"
	node_config_details {
		freeform_tags = {
			"OKEnodePoolName" = "pool1"
		}
		placement_configs {
			availability_domain = "ytrw:US-ASHBURN-AD-1"
			subnet_id = "${oci_core_subnet.service_private_subnet.id}"
		}
		placement_configs {
			availability_domain = "ytrw:US-ASHBURN-AD-2"
			subnet_id = "${oci_core_subnet.service_private_subnet.id}"
		}
		placement_configs {
			availability_domain = "ytrw:US-ASHBURN-AD-3"
			subnet_id = "${oci_core_subnet.service_private_subnet.id}"
		}
		size = "4"
	}
	node_shape = "VM.Standard.A1.Flex"
	node_shape_config {
		memory_in_gbs = "6"
		ocpus = "1"
	}
	node_source_details {
		image_id = "ocid1.image.oc1.iad.aaaaaaaaqfihn5grnv2ughc2lfuqonta4jt3wfcuvnm6la7c5zzds6ygfdbq"
		source_type = "IMAGE"
	}
}