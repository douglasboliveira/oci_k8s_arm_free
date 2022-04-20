resource "oci_identity_compartment" "oke-compartment" {
    compartment_id = ""
    description = "Compartment from Terraform to K8s."
    name = "k8s-compartment"
}
