data "oci_load_balancer_certificates" "load_balancer_certificates_lookup" {
  for_each = var.load_balancer_certificates_lookup

  load_balancer_id = each.value.load_balancer_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

