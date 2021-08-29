#!/bin/bash
#Setup Microservices and Development namespace
echo "---Now Creating Development Namespace---"
kubectl apply -f dev-namespace.yaml
echo "---Now Launching Microservices---"
kubectl apply -f branchesms.yaml
kubectl apply -f loansms.yaml
kubectl apply -f userms.yaml
