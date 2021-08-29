#!/bin/bash
#Delete Microservices and Development namespace
echo "---Now Deleting Microservices---"
kubectl delete -f branchesms.yaml
kubectl delete -f loansms.yaml
kubectl delete -f userms.yaml
echo "---Now Deleting Development Namespace---"
kubectl delete -f dev-namespace.yaml
