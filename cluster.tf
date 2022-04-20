resource "oci_containerengine_cluster" "oke-cluster" {
    # Required
    compartment_id = oci_identity_compartment.oke-compartment.id
    endpoint_config {
		is_public_ip_enabled = "true"
		subnet_id = "${oci_core_subnet.service_public_subnet.id}"
	}
	freeform_tags = {
		"OKEclusterName" = "oke-cluster"
	}
	kubernetes_version = "v1.22.5"
	name = "oke-cluster"
	options {
		admission_controller_options {
			is_pod_security_policy_enabled = "false"
		}
		persistent_volume_config {
			freeform_tags = {
				"OKEclusterName" = "oke-cluster"
			}
		}
		service_lb_config {
			freeform_tags = {
				"OKEclusterName" = "oke-cluster"
			}
		}
		service_lb_subnet_ids = ["${oci_core_subnet.service_lb_subnet.id}"]
	}
	vcn_id = "${oci_core_vcn.oke_core_vcn.id}"
}