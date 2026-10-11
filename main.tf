resource "oci_capacity_management_occ_customer_group" "capacity_management_occ_customer_groups" {
  for_each = var.capacity_management_occ_customer_groups

  compartment_id    = each.value.compartment_id
  display_name      = each.value.display_name
  defined_tags      = each.value.defined_tags
  description       = each.value.description
  freeform_tags     = each.value.freeform_tags
  lifecycle_details = each.value.lifecycle_details
  status            = each.value.status

  dynamic "customers_list" {
    for_each = each.value.customers_list != null ? each.value.customers_list : []
    content {
      description  = customers_list.value.description
      display_name = customers_list.value.display_name
      status       = customers_list.value.status
      tenancy_id   = customers_list.value.tenancy_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

