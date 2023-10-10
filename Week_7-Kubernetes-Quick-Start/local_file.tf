resource "local_file" "k8s_config" {
  content         = digitalocean_kubernetes_cluster.django.kube_config.0.raw_config
  filename        = "${path.module}/django-kubeconfig.yaml"
  file_permission = "0600"
}

resource "local_file" "secret" {
  content = templatefile("${path.module}/tpl/secret.tpl",
    {
      password = base64encode(digitalocean_database_user.django_user.password)
    }
  )
  filename = "${path.module}/helm/django-k8s/templates/secret.yaml"
}

resource "local_file" "configmap" {
  content = templatefile("${path.module}/tpl/configmap.tpl",
    {
      name = digitalocean_database_db.database.name
      user = digitalocean_database_user.django_user.name
      host = digitalocean_database_cluster.postgres.host
      port = digitalocean_database_cluster.postgres.port
    }
  )
  filename = "${path.module}/helm/django-k8s/templates/configmap.yaml"
}
