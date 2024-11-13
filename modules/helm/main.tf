resource "helm_release" "my_chart" {
  name       = var.chart_name
  repository = var.helm_repo_url
  chart      = var.chart_name
  namespace  = var.namespace

  # values = [
  #   file("${path.module}/values.yaml") 
  # ]

  depends_on = [var.cluster]
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "default"
  repository = "https://charts.prometheus.io"
  chart      = "kube-prometheus-stack"
  version    = "45.0.0"  

  values = [
    <<-EOT
      prometheus:
        prometheusSpec:
          scrapeInterval: 15s
          scrapeTimeout: 10s
          externalLabels:
            region: "us-west"

          additionalScrapeConfigs: |
            - job_name: 'python-app-pods'
              kubernetes_sd_configs:
                - role: pod
                  namespaces:
                    names: ['default']
              relabel_configs:
                - source_labels: [__meta_kubernetes_pod_label_app]
                  action: keep
                  regex: python-app
              metrics_path: '/metrics'
              scheme: 'http'

    EOT
  ]

  set {
    name  = "prometheus.prometheusSpec.alerting.enabled"
    value = "true"
  }

  set {
    name  = "prometheus.prometheusSpec.monitoring.enabled"
    value = "true"
  }
}


resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"

  values = [
    <<EOF
    adminUser: "admin"
    adminPassword: "admin_password"

    # Enable service of type LoadBalancer
    service:
      type: LoadBalancer

    datasources:
      datasources.yaml:
        apiVersion: 1
        datasources:
          - name: Prometheus
            type: prometheus
            url: http://prometheus-server.monitoring.svc.cluster.local
            access: proxy
            isDefault: true
    EOF
  ]

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}