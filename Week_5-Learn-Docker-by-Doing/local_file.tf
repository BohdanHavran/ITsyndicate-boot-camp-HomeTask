# Configuration ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/tpl/hosts.tpl",
    {
      database_private_ip = aws_instance.BD.private_ip
      bastion_public_ip   = aws_instance.Bastion.public_ip
    }
  )
  filename = "${path.module}/ansible/hosts.cfg"
}

resource "local_file" "database" {
  content = templatefile("${path.module}/tpl/group_vars.tpl",
    {
      bastion_public_ip = aws_instance.Bastion.public_ip
      ssh_key           = var.private_key
    }
  )
  filename = "${path.module}/ansible/group_vars/database"
}

resource "local_file" "settings" {
  content = templatefile("${path.module}/tpl/settings.tpl",
    {
      db_name     = var.db_name
      db_user     = var.db_user
      db_password = var.db_password
      db_ip       = aws_instance.BD.private_ip
      elb_ip      = aws_lb.web.dns_name
    }
  )
  filename = "${path.module}/docker/sample-django/mysite/settings.py"
}

resource "local_file" "bd_vars" {
  content = templatefile("${path.module}/tpl/bd_vars.tpl",
    {
      db_name     = var.db_name
      db_user     = var.db_user
      db_password = var.db_password
    }
  )
  filename = "${path.module}/ansible/roles/postgres/vars/main.yml"
}
