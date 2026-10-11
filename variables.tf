variable "lb_members_v2s" {
  description = <<EOT
Map of lb_members_v2s, attributes below
Required:
    - pool_id
Optional:
    - region
    - member (block):
        - address (required)
        - admin_state_up (optional)
        - backup (optional)
        - monitor_address (optional)
        - monitor_port (optional)
        - name (optional)
        - protocol_port (required)
        - subnet_id (optional)
        - weight (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    pool_id = string
    region  = optional(string)
    member = optional(list(object({
      address         = string
      admin_state_up  = optional(bool)
      backup          = optional(bool)
      monitor_address = optional(string)
      monitor_port    = optional(number)
      name            = optional(string)
      protocol_port   = number
      subnet_id       = optional(string)
      weight          = optional(number)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lb_members_v2s : (
        v.member == null || alltrue([for item in v.member : (item.protocol_port >= 1 && item.protocol_port <= 65535)])
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.lb_members_v2s : (
        v.member == null || alltrue([for item in v.member : (item.weight == null || (item.weight >= 0 && item.weight <= 256))])
      )
    ])
    error_message = "must be between 0 and 256"
  }
  validation {
    condition = alltrue([
      for k, v in var.lb_members_v2s : (
        v.member == null || alltrue([for item in v.member : (item.monitor_port == null || (item.monitor_port >= 1 && item.monitor_port <= 65535))])
      )
    ])
    error_message = "must be between 1 and 65535"
  }
}

