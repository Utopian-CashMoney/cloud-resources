# EKS Cluster (Note: Requires the eksctl cli tool)

1. How to Launch the Cluster
  eksctl create -f cluster.yaml
2. Create a Development namespace
  kubectl create -f dev-namespace.yaml
3. Launch Microservice Deployments and services
  kubectl apply -f  <Microservice>
  - branchesms
  - loansms
  - userms
4. Retrieve all namespace resources
  kubectl get all -n development
5. View Details of a Deployment
  kubectl -n development describe Deployment <Deployment>
  - branchesms-dep
  - loansms-dep
  - userms-dep
6. View Details of a Deployed Service
  kubectl -n development describe Service <Service>
  - branchesms-service
  - loansms-service
  - userms-service
7. How to tear Down a Cluster
  eksctl delete -f cluster.yaml
