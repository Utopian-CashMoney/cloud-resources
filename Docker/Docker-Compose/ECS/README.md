# Docker Compose with ECS


1. Configure AWS CLI with IAM User account
  - aws configure
2. Create an ECS context for AWS
  - docker context create ecs 'ecsName'
3. Switch contexts to ECS
  - docker context use 'context'
4. How to launch ECS Cluster
  - docker compose up
5. How to take ECS Cluster
  - docker compose down
6. How to switch back to default context
 - docker --context default context use default
7. How to run commands in ECS context from default context
 - docker --context 'contextName' 'Command'

 (Note: Sometimes even after configuration Docker Compose may have some issues launching on ECS due to an issue with credentials.
  If so try this command: aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 'AWS Account Number'.dkr.ecr.us-east-2.amazonaws.com)
