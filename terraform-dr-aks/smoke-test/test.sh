#!/bin/bash
set -e

echo "🚀 Running Smoke Test..."

kubectl get pods -n argocd
velero backup get

APP_IP=$(kubectl get svc microshop -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "App running at: http://$APP_IP"
curl -I http://$APP_IP
