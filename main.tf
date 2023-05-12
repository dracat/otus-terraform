provider "kubernetes" {
  config_path = "~/.kube/config"          # Path to your kubeconfig file
  host        = "https://localhost:42509" # Minikube API server address

}

resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_role" "role-su" {


  metadata {
    name      = "role-su"
    namespace = var.namespace

  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_service_account" "acc" {
  metadata {
    name      = "admin"
    namespace = var.namespace
  }

}
resource "kubernetes_role_binding" "su-admin" {
  metadata {
    name      = "su-admin"
    namespace = var.namespace
  }
  role_ref {
    kind      = "Role"
    name      = "role-su"
    api_group = "rbac.authorization.k8s.io"

  }
  subject {
    name      = "admin"
    kind      = "ServiceAccount"
    namespace = var.namespace
  }

}

variable "namespace" {
  type = string
}
