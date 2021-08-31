#!/bin/sh

echo "---Now Launching Loans Microservice on ECS---"
aws cloudformation deploy --template-file loansECS.yml --stack-name loans-ms --capabilities CAPABILITY_NAMED_IAM --profile default
echo "---Now Launching Branches Microservice on ECS---"
aws cloudformation deploy --template-file branchesECS.yml --stack-name branches-ms --capabilities CAPABILITY_NAMED_IAM --profile default
echo "---Now Launching User Microservice on ECS---"
aws cloudformation deploy --template-file userECS.yml --stack-name user-ms --capabilities CAPABILITY_NAMED_IAM --profile default
