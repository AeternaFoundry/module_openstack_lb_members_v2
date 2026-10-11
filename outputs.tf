output "lb_members_v2s_id" {
  description = "Map of id values across all lb_members_v2s, keyed the same as var.lb_members_v2s except keys with no id are omitted"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lb_members_v2s_member" {
  description = "Map of member values across all lb_members_v2s, keyed the same as var.lb_members_v2s except keys with no member are omitted"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.member if v.member != null && length(v.member) > 0 }
}
output "lb_members_v2s_pool_id" {
  description = "Map of pool_id values across all lb_members_v2s, keyed the same as var.lb_members_v2s except keys with no pool_id are omitted"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.pool_id if v.pool_id != null && length(v.pool_id) > 0 }
}
output "lb_members_v2s_region" {
  description = "Map of region values across all lb_members_v2s, keyed the same as var.lb_members_v2s except keys with no region are omitted"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.region if v.region != null && length(v.region) > 0 }
}

