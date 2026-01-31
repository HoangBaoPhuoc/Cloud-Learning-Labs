#!/bin/bash

# Configuration - Update these values
AWS_REGION="ap-southeast-1"  # Your AWS Region
AWS_ACCOUNT_ID="123456789012"  # Replace with your Backend Account ID
ECR_REPO_NAME="mservice1"  # ECR repository name
AWS_PROFILE="backend-account"  # AWS CLI SSO profile

# Login to ECR
echo "Logging in to ECR..."
aws ecr get-login-password --region ${AWS_REGION} --profile ${AWS_PROFILE} | \
  docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

# Build Docker image
echo "Building Docker image..."
docker build -t ${ECR_REPO_NAME} .

# Tag Docker image
echo "Tagging Docker image..."
docker tag ${ECR_REPO_NAME}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest

# Push to ECR
echo "Pushing to ECR..."
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest

echo "Done! Image pushed to: ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest"