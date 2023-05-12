provider "kubernetes" {
  config_path    = "~/.kube/config"  # Path to your kubeconfig file
  host           = "https://localhost:42509"  # Minikube API server address

}

resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = "otus-homework"
  }
}