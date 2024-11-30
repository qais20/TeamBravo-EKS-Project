resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress-controller"

  create_namespace = true 
  namespace = "nginx-ingress"
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  create_namespace = true 
  namespace = "cert-manager"

#   set {
#     name = "wait-for"
#     value = module.cert_manager_irsa_role.iam_role_arm
#   }

  set {
    name  = "installCRDs"
    value = "true"
  }

  values = [
    "${file("helm-values/cert-manager.yaml")}"
  ]
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://Charts.bitnami.com/bitnami"
  chart      = "external-dns"

  create_namespace = true 
  namespace        = "external-dns"

  values = [
    "${file("helm-values/external-dns.yaml")}"
  ] 
}
