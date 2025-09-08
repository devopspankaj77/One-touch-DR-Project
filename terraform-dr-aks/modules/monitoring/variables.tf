variable "monitoring_namespace" {
  description = "Namespace to deploy Prometheus and Grafana"
  type        = string
  default     = "monitoring"
}

variable "slack_webhook_url" {
  description = "Slack Incoming Webhook URL for Alertmanager"
  type        = string
}
