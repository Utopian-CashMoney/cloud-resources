#!/bin/bash
#Setup Microservices and Development namespace
echo "---Now Creating Development Namespace---"
kubectl apply -f dev-namespace.yaml
echo "---Now Launching Microservices---"
kubectl apply -f branchesms.yaml
kubectl apply -f loansms.yaml
kubectl apply -f userms.yaml

echo "---Port Forwarding Services in 10 Seconds---"
sleep 10

echo "---Now Port-Fowarding Services---"
kubectl port-forward --address localhost deployment/branchesms-dep 8080:8080 -n development &
kubectl port-forward --address localhost deployment/loansms-dep 8020:8020 -n development &
kubectl port-forward --address localhost deployment/userms-dep 8000:8000 -n development &
