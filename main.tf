resource "openstack_lb_members_v2" "lb_members_v2s" {
  for_each = var.lb_members_v2s

  pool_id = each.value.pool_id
  region  = each.value.region

  dynamic "member" {
    for_each = each.value.member != null ? each.value.member : []
    content {
      address         = member.value.address
      admin_state_up  = member.value.admin_state_up
      backup          = member.value.backup
      monitor_address = member.value.monitor_address
      monitor_port    = member.value.monitor_port
      name            = member.value.name
      protocol_port   = member.value.protocol_port
      subnet_id       = member.value.subnet_id
      weight          = member.value.weight
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

