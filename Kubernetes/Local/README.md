# Kubernetes Local

1. Create a Development namespace (Recommended)
  - kubectl create -f dev-namespace.yaml
2. Launch Microservice Deployments and Services
  - kubectl apply -f  'Microservice' -n development
    - branchesms
    - loansms
    - userms
3. Retrieve all namespace resources
  - kubectl get all -n development
4. View Details of a Deployment
  - kubectl -n development describe Deployment/'Deployment'
  - kubectl -n development logs/Deployment 'Deployment'
    - branchesms-dep
    - loansms-dep
    - userms-dep
5. View Details of a Deployed Service
  - kubectl -n development describe/Service 'Service'
    - branchesms-service
    - loansms-service
    - userms-service
6. Command to run kustomize (Compiles all .yaml files at once)
  - kubectl kustomize | kubectl apply -f -
7. How to Port Forward
   - kubectl port-forward --address localhost deployment/'Deployment' 8080:8080 -n development (add '&' at the end to run in the background)
8. Run Script with Port Forwarding
  - ./setup.sh
9. Run Tear Down Script
  - ./cleanup.sh
