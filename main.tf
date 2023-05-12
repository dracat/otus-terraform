provider "kubernetes" {
  config_path    = "~/.kube/config"  # Path to your kubeconfig file
  host           = "https://localhost:42509"  # Minikube API server address

}

resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = "otus-sre-homework"
  }
}

resource "kubernetes_role" "rbac_anyone" {


  metadata {
    name        = "otus-homework-rbac_anyone"
    namespace   = "otus-sre-homework"

  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}