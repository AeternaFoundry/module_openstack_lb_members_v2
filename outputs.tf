output "lb_members_v2s_id" {
  description = "Map of id values across all lb_members_v2s, keyed the same as var.lb_members_v2s"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.id }
}
output "lb_members_v2s_member" {
  description = "Map of member values across all lb_members_v2s, keyed the same as var.lb_members_v2s"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.member }
}
output "lb_members_v2s_pool_id" {
  description = "Map of pool_id values across all lb_members_v2s, keyed the same as var.lb_members_v2s"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.pool_id }
}
output "lb_members_v2s_region" {
  description = "Map of region values across all lb_members_v2s, keyed the same as var.lb_members_v2s"
  value       = { for k, v in openstack_lb_members_v2.lb_members_v2s : k => v.region }
}

