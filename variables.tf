variable "capacity_management_occ_customer_groups" {
  description = <<EOT
Map of capacity_management_occ_customer_groups, attributes below
Required:
    - compartment_id
    - display_name
Optional:
    - defined_tags
    - description
    - freeform_tags
    - lifecycle_details
    - status
    - customers_list (block):
        - description (optional)
        - display_name (required)
        - status (optional)
        - tenancy_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id    = string
    display_name      = string
    defined_tags      = optional(map(string))
    description       = optional(string)
    freeform_tags     = optional(map(string))
    lifecycle_details = optional(string)
    status            = optional(string)
    customers_list = optional(list(object({
      description  = optional(string)
      display_name = string
      status       = optional(string)
      tenancy_id   = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

