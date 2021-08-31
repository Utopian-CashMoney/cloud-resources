#!/bin/sh

echo "---Now taking down Loans Microservice on ECS---"
aws cloudformation delete-stack --stack-name loans-ms --profile default
echo "---Now taking down Branches Microservice on ECS---"
aws cloudformation delete-stack --stack-name branches-ms --profile default
echo "---Now taking down User Microservice on ECS---"
aws cloudformation delete-stack --stack-name user-ms --profile default
